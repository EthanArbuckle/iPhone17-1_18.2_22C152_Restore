@interface SCNLight
+ (BOOL)supportsSecureCoding;
+ (SCNLight)light;
+ (SCNLight)lightWithLightRef:(__C3DLight *)a3;
+ (SCNLight)lightWithMDLLight:(MDLLight *)mdlLight;
+ (SCNLight)lightWithMDLLightProbe:(id)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)automaticallyAdjustsShadowProjection;
- (BOOL)castsShadow;
- (BOOL)doubleSided;
- (BOOL)drawsArea;
- (BOOL)forcesBackFaceCasters;
- (BOOL)hasGobo;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isBaked;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)parallaxCorrectionEnabled;
- (BOOL)sampleDistributedShadowMaps;
- (BOOL)shouldBakeDirectLighting;
- (BOOL)shouldBakeIndirectLighting;
- (BOOL)usesDeferredShadows;
- (BOOL)usesModulatedMode;
- (CGFloat)attenuationEndDistance;
- (CGFloat)attenuationFalloffExponent;
- (CGFloat)attenuationStartDistance;
- (CGFloat)intensity;
- (CGFloat)maximumShadowDistance;
- (CGFloat)orthographicScale;
- (CGFloat)shadowBias;
- (CGFloat)shadowCascadeSplittingFactor;
- (CGFloat)shadowRadius;
- (CGFloat)spotInnerAngle;
- (CGFloat)spotOuterAngle;
- (CGFloat)temperature;
- (CGFloat)zFar;
- (CGFloat)zNear;
- (CGSize)shadowMapSize;
- (NSArray)animationKeys;
- (NSArray)areaPolygonVertices;
- (NSData)sphericalHarmonicsCoefficients;
- (NSString)description;
- (NSString)name;
- (NSUInteger)categoryBitMask;
- (NSUInteger)shadowCascadeCount;
- (NSUInteger)shadowSampleCount;
- (NSURL)IESProfileURL;
- (SCNLight)init;
- (SCNLight)initWithCoder:(id)a3;
- (SCNLight)initWithLightRef:(__C3DLight *)a3;
- (SCNLightAreaType)areaType;
- (SCNLightProbeType)probeType;
- (SCNLightProbeUpdateType)probeUpdateType;
- (SCNLightType)type;
- (SCNMaterialProperty)gobo;
- (SCNMaterialProperty)probeEnvironment;
- (SCNShadowMode)shadowMode;
- (__C3DAnimationManager)animationManager;
- (__C3DLight)lightRef;
- (__C3DScene)sceneRef;
- (double)_shadowCascadeDebugFactor;
- (double)spotFalloffExponent;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)attributeForKey:(NSString *)key;
- (id)color;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifier;
- (id)initPresentationLightWithLightRef:(__C3DLight *)a3;
- (id)presentationLight;
- (id)scene;
- (id)shadowColor;
- (id)technique;
- (simd_float3)areaExtents;
- (simd_float3)parallaxCenterOffset;
- (simd_float3)parallaxExtentsFactor;
- (simd_float3)probeExtents;
- (simd_float3)probeOffset;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNLight:(id)a3;
- (void)_customEncodingOfSCNLight:(id)a3;
- (void)_didDecodeSCNLight:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_resyncObjCModelOfPerTypeParameters;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setAreaExtents:(simd_float3)areaExtents;
- (void)setAreaPolygonVertices:(NSArray *)areaPolygonVertices;
- (void)setAreaType:(SCNLightAreaType)areaType;
- (void)setAttenuationEndDistance:(CGFloat)attenuationEndDistance;
- (void)setAttenuationFalloffExponent:(CGFloat)attenuationFalloffExponent;
- (void)setAttenuationStartDistance:(CGFloat)attenuationStartDistance;
- (void)setAttribute:(id)attribute forKey:(NSString *)key;
- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)automaticallyAdjustsShadowProjection;
- (void)setBaked:(BOOL)a3;
- (void)setCastsShadow:(BOOL)castsShadow;
- (void)setCategoryBitMask:(NSUInteger)categoryBitMask;
- (void)setColor:(id)color;
- (void)setDoubleSided:(BOOL)doubleSided;
- (void)setDrawsArea:(BOOL)drawsArea;
- (void)setForcesBackFaceCasters:(BOOL)forcesBackFaceCasters;
- (void)setIESProfileURL:(NSURL *)IESProfileURL;
- (void)setIESProfileURL:(id)a3 resolvedURL:(id)a4;
- (void)setIdentifier:(id)a3;
- (void)setIntensity:(CGFloat)intensity;
- (void)setMaximumShadowDistance:(CGFloat)maximumShadowDistance;
- (void)setName:(NSString *)name;
- (void)setOrthographicScale:(CGFloat)orthographicScale;
- (void)setParallaxCenterOffset:(simd_float3)parallaxCenterOffset;
- (void)setParallaxCorrectionEnabled:(BOOL)parallaxCorrectionEnabled;
- (void)setParallaxExtentsFactor:(simd_float3)parallaxExtentsFactor;
- (void)setProbeExtents:(simd_float3)probeExtents;
- (void)setProbeOffset:(simd_float3)probeOffset;
- (void)setProbeType:(SCNLightProbeType)probeType;
- (void)setProbeUpdateType:(SCNLightProbeUpdateType)probeUpdateType;
- (void)setSampleDistributedShadowMaps:(BOOL)sampleDistributedShadowMaps;
- (void)setShadowBias:(CGFloat)shadowBias;
- (void)setShadowCascadeCount:(NSUInteger)shadowCascadeCount;
- (void)setShadowCascadeSplittingFactor:(CGFloat)shadowCascadeSplittingFactor;
- (void)setShadowColor:(id)shadowColor;
- (void)setShadowMapSize:(CGSize)shadowMapSize;
- (void)setShadowMode:(SCNShadowMode)shadowMode;
- (void)setShadowRadius:(CGFloat)shadowRadius;
- (void)setShadowSampleCount:(NSUInteger)shadowSampleCount;
- (void)setShouldBakeDirectLighting:(BOOL)a3;
- (void)setShouldBakeIndirectLighting:(BOOL)a3;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setSphericalHarmonicsCoefficients:(id)a3;
- (void)setSpotFalloffExponent:(double)a3;
- (void)setSpotInnerAngle:(CGFloat)spotInnerAngle;
- (void)setSpotOuterAngle:(CGFloat)spotOuterAngle;
- (void)setTechnique:(id)a3;
- (void)setTemperature:(CGFloat)temperature;
- (void)setType:(SCNLightType)type;
- (void)setUsesDeferredShadows:(BOOL)a3;
- (void)setUsesModulatedMode:(BOOL)a3;
- (void)setZFar:(CGFloat)zFar;
- (void)setZNear:(CGFloat)zNear;
- (void)set_shadowCascadeDebugFactor:(double)a3;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNLight

+ (SCNLight)lightWithMDLLight:(MDLLight *)mdlLight
{
  v4 = (SCNLight *)[a1 light];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    -[SCNLight setColor:](v4, "setColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithCGColor:", -[MDLLight color](mdlLight, "color")));
    [(MDLLight *)mdlLight attenuationStartDistance];
    [(SCNLight *)v4 setAttenuationStartDistance:v5];
    [(MDLLight *)mdlLight attenuationEndDistance];
    [(SCNLight *)v4 setAttenuationEndDistance:v6];
    [(MDLLight *)mdlLight innerConeAngle];
    [(SCNLight *)v4 setSpotInnerAngle:v7];
    [(MDLLight *)mdlLight outerConeAngle];
    [(SCNLight *)v4 setSpotOuterAngle:v8];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[SCNLight setColor:](v4, "setColor:", [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]);
    }
  }
  MDLLightType v9 = [(MDLLight *)mdlLight lightType];
  if (v9 - 1 <= 3) {
    [(SCNLight *)v4 setType:*off_264004B48[v9 - 1]];
  }
  return v4;
}

+ (SCNLight)lightWithMDLLightProbe:(id)a3
{
  v3 = (SCNLight *)objc_msgSend(a1, "light", a3);
  [(SCNLight *)v3 setType:@"probe"];
  return v3;
}

- (SCNLight)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNLight;
  v2 = [(SCNLight *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DLightCreate();
    v2->_light = (__C3DLight *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNLight *)v2 _syncObjCModel];
  }
  return v2;
}

- (SCNLight)initWithLightRef:(__C3DLight *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNLight;
  v4 = [(SCNLight *)&v7 init];
  if (v4)
  {
    objc_super v5 = (__C3DLight *)CFRetain(a3);
    v4->_light = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNLight *)v4 _syncObjCModel];
    [(SCNLight *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (id)initPresentationLightWithLightRef:(__C3DLight *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNLight;
  v4 = [(SCNLight *)&v7 init];
  objc_super v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    v4->_light = (__C3DLight *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (__C3DLight)lightRef
{
  return self->_light;
}

+ (SCNLight)light
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNLight *)v2;
}

+ (SCNLight)lightWithLightRef:(__C3DLight *)a3
{
  result = (SCNLight *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    float v6 = (void *)[objc_alloc((Class)a1) initWithLightRef:a3];
    return (SCNLight *)v6;
  }
  return result;
}

- (void)dealloc
{
  light = self->_light;
  if (light)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)light, 0);
      light = self->_light;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __19__SCNLight_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = light;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v5];
  }

  [(SCNMaterialProperty *)self->_gobo parentWillDie:self];
  [(SCNMaterialProperty *)self->_probeEnvironment parentWillDie:self];

  v4.receiver = self;
  v4.super_class = (Class)SCNLight;
  [(SCNLight *)&v4 dealloc];
}

void __19__SCNLight_dealloc__block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  NSUInteger v3 = [(NSString *)[(SCNLight *)self name] length];
  objc_super v4 = NSString;
  objc_super v5 = (objc_class *)objc_opt_class();
  float v6 = NSStringFromClass(v5);
  if (v3) {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p '%@' | type=%@>", v6, self, -[SCNLight name](self, "name"), -[SCNLight type](self, "type")];
  }
  else {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p | type=%@>", v6, self, -[SCNLight type](self, "type"), v8];
  }
}

- (void)setName:(NSString *)name
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setName:]();
    }
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[(NSString *)name copy];
      objc_super v5 = [(SCNLight *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __20__SCNLight_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

CFStringRef __20__SCNLight_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  return C3DEntitySetName(v2, v3);
}

- (NSString)name
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_name;
  }
  objc_super v4 = [(SCNLight *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (NSString *)C3DEntityGetName((uint64_t)[(SCNLight *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (void)setIdentifier:(id)a3
{
  objc_super v4 = [(SCNLight *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (id)identifier
{
  uint64_t v2 = [(SCNLight *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (void)_syncEntityObjCModel
{
  CFStringRef v3 = [(SCNLight *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (void)_syncObjCModel
{
  CFStringRef v3 = [(SCNLight *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }

  int Type = C3DLightGetType((uint64_t)self->_light);
  self->_type = SCNLightTypeFromC3DLightType(Type);
  uint64_t Color = C3DLightGetColor((uint64_t)self->_light);

  self->_color = (id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", Color);
  self->_intensity = C3DLightGetIntensity((uint64_t)self->_light);
  self->_temperature = C3DLightGetTemperature((uint64_t)self->_light);
  v24[0] = C3DLightGetShadowColor((uint64_t)self->_light);
  v24[1] = v7;

  self->_shadowuint64_t Color = (id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", v24);
  if (C3DLightGetCastsShadow((uint64_t)self->_light)) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFD | v8;
  self->_shadowRadius = C3DLightGetShadowRadius((uint64_t)self->_light);
  self->_zNear = C3DLightGetZNear((uint64_t)self->_light);
  self->_zFar = C3DLightGetZFar((uint64_t)self->_light);
  self->_shadowBias = C3DLightGetShadowBias((uint64_t)self->_light);
  self->_attenuationEndDistance = C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
  self->_attenuationFalloffExponent = C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
  self->_spotInnerAngle = C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
  self->_spotOuterAngle = C3DLightGetSpotInnerAngle((uint64_t)self->_light);
  self->_spotFalloffExponent = C3DLightGetSpotOuterAngle((uint64_t)self->_light);
  *(&self->_spotFalloffExponent + 1) = C3DLightGetSpotFalloffExponent((uint64_t)self->_light);

  Gobo = (SCNMaterialProperty *)C3DLightGetGobo((uint64_t)self->_light, 0);
  if (Gobo) {
    Gobo = [[SCNMaterialProperty alloc] initWithParent:self propertyType:22];
  }
  self->_gobo = Gobo;
  long long v22 = 0u;
  float32x4_t v23 = 0u;
  C3DLightGetAreaDescription((uint64_t)self->_light, &v22);
  int v10 = v22;
  self->_areaint Type = v22;
  float32x4_t v11 = v23;
  switch(v10)
  {
    case 0:
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.f32[0] = v23.f32[0] + v23.f32[0];
      break;
    case 1:
    case 2:
      v11.i32[2] = 0.5;
      goto LABEL_10;
    case 3:
LABEL_10:
      _Q0 = vaddq_f32(v11, v11);
      break;
    default:
      __asm { FMOV            V0.4S, #1.0; jumptable 000000020B3CE1A8 default case }
      break;
  }
  *(float32x4_t *)self->_areaExtents = _Q0;
  v21[0] = v22;
  v21[1] = v23;
  self->_areaPolygonVertices = (NSArray *)_SCNAreaLightpolygonVerticesFromDescription((uint64_t)v21);
  self->_drawsArea = C3DLightGetDrawsArea((uint64_t)self->_light);
  self->_doubleSided = C3DLightGetDoubleSided((uint64_t)self->_light);
  self->_categoryBitMask = C3DLightGetCategoryBitMask((uint64_t)self->_light);
  self->_orthographicScale = C3DLightGetOrthographicScale((uint64_t)self->_light);
  self->_shadowSampleCount = C3DLightGetShadowSampleCount((uint64_t)self->_light);
  if (C3DLightGetUsesDeferredShadows((uint64_t)self->_light)) {
    char v17 = 4;
  }
  else {
    char v17 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v17;
  if (C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)self->_light)) {
    char v18 = 0x80;
  }
  else {
    char v18 = 0;
  }
  *((unsigned char *)self + 16) = v18 & 0x80 | *((unsigned char *)self + 16) & 0x7F;
  self->_maximumShadowDistance = C3DMeshElementGetPointSize((uint64_t)self->_light);
  self->_shadowCascadeCount = C3DLightGetShadowCascadeCount((uint64_t)self->_light);
  self->_shadowCascadeSplittingFactor = C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xFE | C3DLightGetForceCasterBackFaceOnly((uint64_t)self->_light);
  if (C3DLightGetEnableSampleDistributed((uint64_t)self->_light)) {
    char v19 = 2;
  }
  else {
    char v19 = 0;
  }
  *((unsigned char *)self + 17) = *((unsigned char *)self + 17) & 0xFD | v19;

  ProbeEnvironment = (SCNMaterialProperty *)C3DLightGetProbeEnvironment((uint64_t)self->_light, 0);
  if (ProbeEnvironment) {
    ProbeEnvironment = [[SCNMaterialProperty alloc] initWithParent:self propertyType:25];
  }
  self->_probeEnvironment = ProbeEnvironment;
  self->_probeint Type = C3DLightGetProbeType((uint64_t)self->_light);
  self->_probeUpdateint Type = C3DLightGetProbeUpdateType((uint64_t)self->_light);
  self->_parallaxCorrectionEnabled = C3DLightGetParallaxCorrectionEnabled((uint64_t)self->_light);
  *(__n128 *)&self->_probeExtents[7] = C3DLightGetProbeExtents((__n128 *)self->_light);
  *(__n128 *)&self->_probeOffset[7] = C3DLightGetProbeOffset((__n128 *)self->_light);
  *(__n128 *)&self->_parallaxExtentsFactor[7] = C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
  *(__n128 *)&self->_parallaxCenterOffset[7] = C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
  [(SCNLight *)self _syncEntityObjCModel];
  if (v4) {
    C3DSceneUnlock(v4);
  }
}

- (id)presentationLight
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    id v2 = [[SCNLight alloc] initPresentationLightWithLightRef:*((void *)self + 1)];
    return v2;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (__C3DScene)sceneRef
{
  id v2 = [(SCNLight *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (id)scene
{
  id result = [(SCNLight *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (void)__CFObject
{
  return self->_light;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  if (self->_gobo != a4) {
    return 0;
  }
  float v6 = (__CFString *)[NSString stringWithFormat:@"%@.%@", @"gobo", a3];

  return SCNCreateAnimationChannelWithObjectAndPath(self, v6);
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNLight *)self sceneRef];
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
    MDLLightType v9 = [(SCNLight *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      int v10 = scn_default_log();
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
    BOOL v8 = [(SCNLight *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__SCNLight_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    MDLLightType v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __38__SCNLight_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 5);
    [*((id *)a1[5] + 3) removeObjectForKey:a1[6]];
    id v2 = (os_unfair_lock_s *)((char *)a1[5] + 20);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    float v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      float v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    uint64_t v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNLight *)self addAnimationPlayer:v7 forKey:v5];
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
  uint64_t v4 = [(SCNLight *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __31__SCNLight_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __31__SCNLight_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  float v6 = [(SCNLight *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SCNLight_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __52__SCNLight_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    float v6 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNLight_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __34__SCNLight_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __51__SCNLight_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __51__SCNLight_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  uint64_t v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
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
  CFStringRef v3 = [(SCNLight *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNLight *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      uint64_t v7 = scn_default_log();
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
  id v3 = [(SCNLight *)self _scnAnimationForKey:a3];
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
        float32x4_t v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNLight *)self addAnimationPlayer:v11 forKey:v10];
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
  CFDictionaryRef v9 = [(SCNLight *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    float32x4_t v11 = [(SCNLight *)self animationManager];
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
  BOOL v5 = [(SCNLight *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SCNLight_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __33__SCNLight_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNLight *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SCNLight_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __34__SCNLight_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNLight *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__SCNLight_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __37__SCNLight_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNLight *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNLight *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    CFDictionaryRef v9 = [(SCNLight *)self animationManager];
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

    long long v15 = [(SCNLight *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __60__SCNLight_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __60__SCNLight_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNLight *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__SCNLight_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __33__SCNLight_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNLight *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __29__SCNLight_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __29__SCNLight_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqual:@"color"])
  {
    [(SCNLight *)self setColor:a4];
  }
  else if (([a3 isEqual:@"image"] & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)SCNLight;
    [(SCNLight *)&v11 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
  }
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  objc_msgSend(v4, "setIdentifier:", -[SCNLight identifier](self, "identifier"));
  [(SCNLight *)self intensity];
  objc_msgSend(v4, "setIntensity:");
  objc_msgSend(v4, "setColor:", -[SCNLight color](self, "color"));
  objc_msgSend(v4, "setName:", -[SCNLight name](self, "name"));
  objc_msgSend(v4, "setType:", -[SCNLight type](self, "type"));
  objc_msgSend(v4, "setShadowColor:", -[SCNLight shadowColor](self, "shadowColor"));
  [(SCNLight *)self shadowRadius];
  objc_msgSend(v4, "setShadowRadius:");
  objc_msgSend(v4, "setCastsShadow:", -[SCNLight castsShadow](self, "castsShadow"));
  objc_msgSend(v4, "setShadowSampleCount:", -[SCNLight shadowSampleCount](self, "shadowSampleCount"));
  [(SCNLight *)self orthographicScale];
  objc_msgSend(v4, "setOrthographicScale:");
  [(SCNLight *)self zNear];
  objc_msgSend(v4, "setZNear:");
  [(SCNLight *)self zFar];
  objc_msgSend(v4, "setZFar:");
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNLight categoryBitMask](self, "categoryBitMask"));
  [(SCNLight *)self attenuationEndDistance];
  objc_msgSend(v4, "setAttenuationEndDistance:");
  [(SCNLight *)self attenuationStartDistance];
  objc_msgSend(v4, "setAttenuationStartDistance:");
  [(SCNLight *)self attenuationFalloffExponent];
  objc_msgSend(v4, "setAttenuationFalloffExponent:");
  [(SCNLight *)self spotInnerAngle];
  objc_msgSend(v4, "setSpotInnerAngle:");
  [(SCNLight *)self spotOuterAngle];
  objc_msgSend(v4, "setSpotOuterAngle:");
  [(SCNLight *)self maximumShadowDistance];
  objc_msgSend(v4, "setMaximumShadowDistance:");
  objc_msgSend(v4, "setAutomaticallyAdjustsShadowProjection:", -[SCNLight automaticallyAdjustsShadowProjection](self, "automaticallyAdjustsShadowProjection"));
  objc_msgSend(v4, "setShadowCascadeCount:", -[SCNLight shadowCascadeCount](self, "shadowCascadeCount"));
  if (self->_gobo) {
    objc_msgSend((id)objc_msgSend(v4, "gobo"), "copyPropertiesFrom:", self->_gobo);
  }
  objc_msgSend(v4, "setIESProfileURL:", -[SCNLight IESProfileURL](self, "IESProfileURL"));
  objc_msgSend(v4, "setAreaType:", -[SCNLight areaType](self, "areaType"));
  [(SCNLight *)self areaExtents];
  objc_msgSend(v4, "setAreaExtents:");
  objc_msgSend(v4, "setAreaPolygonVertices:", -[SCNLight areaPolygonVertices](self, "areaPolygonVertices"));
  objc_msgSend(v4, "setDrawsArea:", -[SCNLight drawsArea](self, "drawsArea"));
  objc_msgSend(v4, "setDoubleSided:", -[SCNLight doubleSided](self, "doubleSided"));
  objc_msgSend(v4, "setProbeType:", -[SCNLight probeType](self, "probeType"));
  objc_msgSend(v4, "setProbeUpdateType:", -[SCNLight probeUpdateType](self, "probeUpdateType"));
  [(SCNLight *)self probeExtents];
  objc_msgSend(v4, "setProbeExtents:");
  [(SCNLight *)self probeOffset];
  objc_msgSend(v4, "setProbeOffset:");
  objc_msgSend(v4, "setParallaxCorrectionEnabled:", -[SCNLight parallaxCorrectionEnabled](self, "parallaxCorrectionEnabled"));
  if (self->_probeEnvironment) {
    objc_msgSend((id)objc_msgSend(v4, "probeEnvironment"), "copyPropertiesFrom:", self->_probeEnvironment);
  }
  [v4 _copyAnimationsFrom:self];
  +[SCNTransaction commitImmediate];
  return v4;
}

- (id)copy
{
  return [(SCNLight *)self copyWithZone:0];
}

- (void)setAttribute:(id)attribute forKey:(NSString *)key
{
  if ([(NSString *)key isEqualToString:@"SCNLightAttenuationStartKey"])
  {
    [attribute floatValue];
    double v8 = v7;
    [(SCNLight *)self setAttenuationStartDistance:v8];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightAttenuationEndKey"])
  {
    [attribute floatValue];
    double v10 = v9;
    [(SCNLight *)self setAttenuationEndDistance:v10];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightAttenuationFalloffExponentKey"])
  {
    [attribute floatValue];
    double v12 = v11;
    [(SCNLight *)self setAttenuationFalloffExponent:v12];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotInnerAngleKey"])
  {
    [attribute floatValue];
    double v14 = v13;
    [(SCNLight *)self setSpotInnerAngle:v14];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotOuterAngleKey"])
  {
    [attribute floatValue];
    double v16 = v15;
    [(SCNLight *)self setSpotOuterAngle:v16];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotFalloffExponentKey"])
  {
    [attribute floatValue];
    double v18 = v17;
    [(SCNLight *)self setSpotFalloffExponent:v18];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightShadowNearClippingKey"])
  {
    [attribute floatValue];
    double v20 = v19;
    [(SCNLight *)self setZNear:v20];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightShadowFarClippingKey"])
  {
    [attribute floatValue];
    double v22 = v21;
    [(SCNLight *)self setZFar:v22];
  }
}

- (id)attributeForKey:(NSString *)key
{
  if ([(NSString *)key isEqualToString:@"SCNLightAttenuationStartKey"])
  {
    [(SCNLight *)self attenuationStartDistance];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightAttenuationEndKey"])
  {
    [(SCNLight *)self attenuationEndDistance];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightAttenuationFalloffExponentKey"])
  {
    [(SCNLight *)self attenuationFalloffExponent];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotInnerAngleKey"])
  {
    [(SCNLight *)self spotInnerAngle];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotOuterAngleKey"])
  {
    [(SCNLight *)self spotOuterAngle];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightSpotFalloffExponentKey"])
  {
    [(SCNLight *)self spotFalloffExponent];
  }
  else if ([(NSString *)key isEqualToString:@"SCNLightShadowNearClippingKey"])
  {
    [(SCNLight *)self zNear];
  }
  else
  {
    if (![(NSString *)key isEqualToString:@"SCNLightShadowFarClippingKey"]) {
      return 0;
    }
    [(SCNLight *)self zFar];
  }
  uint64_t v6 = NSNumber;
  *(float *)&double v5 = v5;

  return (id)[v6 numberWithFloat:v5];
}

- (NSData)sphericalHarmonicsCoefficients
{
  return self->_sphericalHarmonics;
}

- (void)setSphericalHarmonicsCoefficients:(id)a3
{
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics != a3)
  {

    self->_sphericalHarmonics = (NSData *)[a3 copy];
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __46__SCNLight_setSphericalHarmonicsCoefficients___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __46__SCNLight_setSphericalHarmonicsCoefficients___block_invoke(uint64_t a1)
{
}

- (BOOL)shouldBakeDirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 5) & 1;
}

- (void)setShouldBakeDirectLighting:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xDF | v3;
}

- (BOOL)shouldBakeIndirectLighting
{
  return (*((unsigned __int8 *)self + 16) >> 6) & 1;
}

- (void)setShouldBakeIndirectLighting:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xBF | v3;
}

- (CGFloat)attenuationEndDistance
{
  if (*((unsigned char *)self + 16))
  {
    id v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float AttenuationEndDistance = C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationEndDistance((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_attenuationFalloffExponent;
  }
  return AttenuationEndDistance;
}

- (void)setAttenuationEndDistance:(CGFloat)attenuationEndDistance
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setAttenuationEndDistance:]();
    }
  }
  else if (self->_attenuationFalloffExponent != attenuationEndDistance)
  {
    float v5 = attenuationEndDistance;
    self->_attenuationFalloffExponent = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCNLight_setAttenuationEndDistance___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationEndDistance;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"attenuationEndDistance" applyBlock:v8];
  }
}

float __38__SCNLight_setAttenuationEndDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationEndDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)attenuationFalloffExponent
{
  if (*((unsigned char *)self + 16))
  {
    id v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float AttenuationFalloffExponent = C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationFalloffExponent((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotInnerAngle;
  }
  return AttenuationFalloffExponent;
}

- (void)setAttenuationFalloffExponent:(CGFloat)attenuationFalloffExponent
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setAttenuationFalloffExponent:]();
    }
  }
  else if (self->_spotInnerAngle != attenuationFalloffExponent)
  {
    float v5 = attenuationFalloffExponent;
    self->_spotInnerAngle = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __42__SCNLight_setAttenuationFalloffExponent___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationFalloffExponent;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"attenuationFalloffExponent" applyBlock:v8];
  }
}

float __42__SCNLight_setAttenuationFalloffExponent___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationFalloffExponent(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)attenuationStartDistance
{
  if (*((unsigned char *)self + 16))
  {
    id v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float AttenuationStartDistance = C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetAttenuationStartDistance((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_attenuationEndDistance;
  }
  return AttenuationStartDistance;
}

- (void)setAttenuationStartDistance:(CGFloat)attenuationStartDistance
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setAttenuationStartDistance:]();
    }
  }
  else if (self->_attenuationEndDistance != attenuationStartDistance)
  {
    float v5 = attenuationStartDistance;
    self->_attenuationEndDistance = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__SCNLight_setAttenuationStartDistance___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = attenuationStartDistance;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"attenuationStartDistance" applyBlock:v8];
  }
}

float __40__SCNLight_setAttenuationStartDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetAttenuationStartDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)isBaked
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    float v5 = [(SCNLight *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char Baked = C3DLightGetBaked((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = Baked;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetBaked((uint64_t)light);
    }
  }
  else
  {
    return (v2 >> 4) & 1;
  }
  return v3;
}

- (void)setBaked:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setBaked:]();
    }
  }
  else if (((((v4 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 16;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xEF | v6;
    float v7 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __21__SCNLight_setBaked___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = a3;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __21__SCNLight_setBaked___block_invoke(uint64_t a1)
{
}

- (BOOL)castsShadow
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    float v5 = [(SCNLight *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char CastsShadow = C3DLightGetCastsShadow((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = CastsShadow;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetCastsShadow((uint64_t)light);
    }
  }
  else
  {
    return (v2 >> 1) & 1;
  }
  return v3;
}

- (void)setCastsShadow:(BOOL)castsShadow
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setCastsShadow:]();
    }
  }
  else if (((((v4 & 2) == 0) ^ castsShadow) & 1) == 0)
  {
    if (castsShadow) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xFD | v6;
    float v7 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __27__SCNLight_setCastsShadow___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = castsShadow;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __27__SCNLight_setCastsShadow___block_invoke(uint64_t a1)
{
}

- (NSUInteger)categoryBitMask
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_categoryBitMask;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    NSUInteger CategoryBitMask = C3DLightGetCategoryBitMask((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return CategoryBitMask;
  }
  else
  {
    light = self->_light;
    return C3DLightGetCategoryBitMask((uint64_t)light);
  }
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setCategoryBitMask:]();
    }
  }
  else if (self->_categoryBitMask != categoryBitMask)
  {
    self->_categoryBitMask = categoryBitMask;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNLight_setCategoryBitMask___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __31__SCNLight_setCategoryBitMask___block_invoke(uint64_t a1)
{
}

- (id)color
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_color;
  }
  char v4 = [(SCNLight *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  uint64_t Color = C3DLightGetColor((uint64_t)self->_light);
  int v3 = (void *)C3DColor4ToRGBCFColor(Color);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return v3;
}

- (void)setColor:(id)color
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setColor:]();
    }
  }
  else
  {
    id v5 = self->_color;
    if (v5 != color)
    {

      self->_color = color;
      char v6 = [(SCNLight *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __21__SCNLight_setColor___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = color;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"color" applyBlock:v8];
    }
  }
}

void __21__SCNLight_setColor___block_invoke(uint64_t a1)
{
  v3[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v3[1] = v2;
  C3DLightSetColor(*(void *)(*(void *)(a1 + 40) + 8), (float *)v3);
}

- (CGFloat)intensity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_intensity;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetIntensity((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double Intensity = C3DLightGetIntensity((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return Intensity;
}

- (void)setIntensity:(CGFloat)intensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setIntensity:]();
    }
  }
  else if (self->_intensity != intensity)
  {
    self->_intensity = intensity;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__SCNLight_setIntensity___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = intensity;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"intensity" applyBlock:v7];
  }
}

float __25__SCNLight_setIntensity___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  a2.i64[0] = *(void *)(a1 + 40);
  a2.f32[0] = *(double *)a2.i64;
  C3DLightSetIntensity(*(void *)(*(void *)(a1 + 32) + 8), a2, a3, a4, a5, a6, a7, a8);
  return result;
}

- (CGFloat)orthographicScale
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_orthographicScale;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetOrthographicScale((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double OrthographicScale = C3DLightGetOrthographicScale((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return OrthographicScale;
}

- (void)setOrthographicScale:(CGFloat)orthographicScale
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setOrthographicScale:]();
    }
  }
  else if (self->_orthographicScale != orthographicScale)
  {
    self->_orthographicScale = orthographicScale;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SCNLight_setOrthographicScale___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = orthographicScale;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"orthographicScale" applyBlock:v7];
  }
}

float __33__SCNLight_setOrthographicScale___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetOrthographicScale(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)shadowBias
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowBias;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double ShadowBias = C3DLightGetShadowBias((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return ShadowBias;
  }
  else
  {
    light = self->_light;
    return C3DLightGetShadowBias((uint64_t)light);
  }
}

- (void)setShadowBias:(CGFloat)shadowBias
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowBias:]();
    }
  }
  else if (self->_shadowBias != shadowBias)
  {
    self->_shadowBias = shadowBias;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __26__SCNLight_setShadowBias___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = shadowBias;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"shadowBias" applyBlock:v7];
  }
}

void __26__SCNLight_setShadowBias___block_invoke(uint64_t a1)
{
}

- (id)shadowColor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowColor;
  }
  char v4 = [(SCNLight *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  v8[0] = C3DLightGetShadowColor((uint64_t)self->_light);
  v8[1] = v6;
  int v3 = (void *)C3DColor4ToRGBCFColor((uint64_t)v8);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return v3;
}

- (void)setShadowColor:(id)shadowColor
{
  if (*((unsigned char *)self + 16))
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowColor:]();
    }
  }
  else
  {
    id v5 = self->_shadowColor;
    if (v5 != shadowColor)
    {

      self->_shadowuint64_t Color = shadowColor;
      uint64_t v6 = [(SCNLight *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __27__SCNLight_setShadowColor___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = shadowColor;
      v8[5] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"shadowColor" applyBlock:v8];
    }
  }
}

double __27__SCNLight_setShadowColor___block_invoke(uint64_t a1)
{
  v4.n128_u64[0] = C3DColor4FromRGBCFColor(*(const void **)(a1 + 32), 0);
  v4.n128_u64[1] = v2;
  *(void *)&double result = C3DLightSetShadowColor((__n128 *)*(void *)(*(void *)(a1 + 40) + 8), &v4).n128_u64[0];
  return result;
}

- (CGSize)shadowMapSize
{
  if (*((unsigned char *)self + 16))
  {
    __n128 v4 = [(SCNLight *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    CGSize shadowMapSize = (CGSize)vcvtq_f64_f32(COERCE_FLOAT32X2_T(C3DLightGetShadowMapSize((uint64_t)self->_light)));
    if (v5)
    {
      CGSize v7 = shadowMapSize;
      C3DSceneUnlock(v5);
      CGSize shadowMapSize = v7;
    }
  }
  else
  {
    CGSize shadowMapSize = self->_shadowMapSize;
  }
  double height = shadowMapSize.height;
  result.width = shadowMapSize.width;
  result.double height = height;
  return result;
}

- (void)setShadowMapSize:(CGSize)shadowMapSize
{
  if (*((unsigned char *)self + 16))
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowMapSize:]();
    }
  }
  else
  {
    CGFloat height = shadowMapSize.height;
    CGFloat width = shadowMapSize.width;
    if (shadowMapSize.width != self->_shadowMapSize.width || shadowMapSize.height != self->_shadowMapSize.height)
    {
      self->_CGSize shadowMapSize = shadowMapSize;
      CGSize v7 = [(SCNLight *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __29__SCNLight_setShadowMapSize___block_invoke;
      v9[3] = &unk_264007A28;
      v9[4] = self;
      *(CGFloat *)&void v9[5] = width;
      *(CGFloat *)&v9[6] = height;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
    }
  }
}

void __29__SCNLight_setShadowMapSize___block_invoke(uint64_t a1)
{
}

- (CGFloat)shadowRadius
{
  if (*((unsigned char *)self + 16))
  {
    __n128 v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ShadowRadius = C3DLightGetShadowRadius((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetShadowRadius((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_shadowRadius;
  }
  return ShadowRadius;
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowRadius:]();
    }
  }
  else if (self->_shadowRadius != shadowRadius)
  {
    float v5 = shadowRadius;
    self->_shadowRadius = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __28__SCNLight_setShadowRadius___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = shadowRadius;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"shadowRadius" applyBlock:v8];
  }
}

float __28__SCNLight_setShadowRadius___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetShadowRadius(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (NSUInteger)shadowSampleCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowSampleCount;
  }
  __n128 v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetShadowSampleCount((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  NSUInteger ShadowSampleCount = C3DLightGetShadowSampleCount((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowSampleCount;
}

- (void)setShadowSampleCount:(NSUInteger)shadowSampleCount
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowSampleCount:]();
    }
  }
  else
  {
    if (shadowSampleCount >= 0x40) {
      NSUInteger v4 = 64;
    }
    else {
      NSUInteger v4 = shadowSampleCount;
    }
    if (v4 != self->_shadowSampleCount)
    {
      self->_shadowSampleCount = v4;
      uint64_t v5 = [(SCNLight *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __33__SCNLight_setShadowSampleCount___block_invoke;
      v7[3] = &unk_264004FC0;
      v7[4] = self;
      v7[5] = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

void __33__SCNLight_setShadowSampleCount___block_invoke(uint64_t a1)
{
}

- (double)spotFalloffExponent
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float SpotFalloffExponent = C3DLightGetSpotFalloffExponent((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotFalloffExponent((uint64_t)self->_light);
    }
  }
  else
  {
    return *(&self->_spotFalloffExponent + 1);
  }
  return SpotFalloffExponent;
}

- (void)setSpotFalloffExponent:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setSpotFalloffExponent:]();
    }
  }
  else if (*(&self->_spotFalloffExponent + 1) != a3)
  {
    float v5 = a3;
    *(&self->_spotFalloffExponent + 1) = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __35__SCNLight_setSpotFalloffExponent___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(double *)&v8[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"spotFalloffExponent" applyBlock:v8];
  }
}

float __35__SCNLight_setSpotFalloffExponent___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetSpotFalloffExponent(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spotInnerAngle
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float SpotInnerAngle = C3DLightGetSpotInnerAngle((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotInnerAngle((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotOuterAngle;
  }
  return SpotInnerAngle;
}

- (void)setSpotInnerAngle:(CGFloat)spotInnerAngle
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setSpotInnerAngle:]();
    }
  }
  else if (self->_spotOuterAngle != spotInnerAngle)
  {
    float v5 = spotInnerAngle;
    self->_spotOuterAngle = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __30__SCNLight_setSpotInnerAngle___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = spotInnerAngle;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"spotInnerAngle" applyBlock:v8];
  }
}

float __30__SCNLight_setSpotInnerAngle___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetSpotInnerAngle(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (CGFloat)spotOuterAngle
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float SpotOuterAngle = C3DLightGetSpotOuterAngle((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetSpotOuterAngle((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_spotFalloffExponent;
  }
  return SpotOuterAngle;
}

- (void)setSpotOuterAngle:(CGFloat)spotOuterAngle
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setSpotOuterAngle:]();
    }
  }
  else if (self->_spotFalloffExponent != spotOuterAngle)
  {
    float v5 = spotOuterAngle;
    self->_spotFalloffExponent = v5;
    uint64_t v6 = [(SCNLight *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __30__SCNLight_setSpotOuterAngle___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = spotOuterAngle;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"spotOuterAngle" applyBlock:v8];
  }
}

float __30__SCNLight_setSpotOuterAngle___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetSpotOuterAngle(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (id)technique
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v4 = [(SCNLight *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    uint64_t Technique = C3DLightGetTechnique((uint64_t)self->_light);
    if (Technique)
    {
      int v3 = +[SCNTechnique techniqueWithTechniqueRef:Technique];
      if (!v5) {
        return v3;
      }
    }
    else
    {
      int v3 = 0;
      if (!v5) {
        return v3;
      }
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_technique;
}

- (void)setTechnique:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setTechnique:]();
    }
  }
  else
  {
    technique = self->_technique;
    if (technique != a3)
    {

      self->_technique = (SCNTechnique *)a3;
      uint64_t v6 = [(SCNLight *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __25__SCNLight_setTechnique___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

void __25__SCNLight_setTechnique___block_invoke(uint64_t a1)
{
  float v1 = *(void **)(*(void *)(a1 + 32) + 8);
  unint64_t v2 = (const void *)objc_msgSend(*(id *)(a1 + 40), "__CFObject");

  C3DLightSetTechnique(v1, v2);
}

- (CGFloat)temperature
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_temperature;
  }
  NSUInteger v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetTemperature((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double Temperature = C3DLightGetTemperature((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return Temperature;
}

- (void)setTemperature:(CGFloat)temperature
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setTemperature:]();
    }
  }
  else if (self->_temperature != temperature)
  {
    self->_temperature = temperature;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNLight_setTemperature___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = temperature;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"temperature" applyBlock:v7];
  }
}

float __27__SCNLight_setTemperature___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
  a2.i64[0] = *(void *)(a1 + 40);
  a2.f32[0] = *(double *)a2.i64;
  C3DLightSetTemperature(*(void *)(*(void *)(a1 + 32) + 8), a2, a3, a4, a5, a6, a7, a8);
  return result;
}

- (void)_resyncObjCModelOfPerTypeParameters
{
  self->_spotOuterAngle = 0.0;
  self->_spotFalloffExponent = 45.0;
  *((_DWORD *)&self->_spotFalloffExponent + 1) = 1065353216;
  self->_drawsArea = kDefaultAreaDrawsArea;
  self->_doubleSided = kDefaultAreaDoubleSided;
  *(void *)&long long v3 = 0x3F0000003F000000;
  *((void *)&v3 + 1) = 0x3F0000003F000000;
  *(_OWORD *)self->_areaExtents = v3;
  self->_areaint Type = 1;
  self->_probeint Type = kDefaultProbeType;
  self->_probeUpdateint Type = kDefaultProbeUpdateType;
  self->_parallaxCorrectionEnabled = kDefaultParallaxCorrectionEnabled;
  *(_OWORD *)&self->_probeExtents[7] = kDefaultProbeExtents;
  *(_OWORD *)&self->_probeOffset[7] = kDefaultProbeOffset;
  *(_OWORD *)&self->_parallaxExtentsFactor[7] = kDefaultProbeParallaxExtents;
  *(_OWORD *)&self->_parallaxCenterOffset[7] = kDefaultProbeParallaxOffset;

  self->_IESProfileURL = 0;
}

- (SCNLightType)type
{
  if (*((unsigned char *)self + 16))
  {
    NSUInteger v4 = [(SCNLight *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    int Type = C3DLightGetType((uint64_t)self->_light);
    SCNLightType v3 = SCNLightTypeFromC3DLightType(Type);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    SCNLightType v3 = self->_type;
  }
  CGSize v7 = (void *)[(NSString *)v3 copy];

  return (SCNLightType)v7;
}

- (void)setType:(SCNLightType)type
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setType:]();
    }
  }
  else
  {
    uint64_t v5 = self->_type;
    if (v5 != type)
    {

      self->_type = (NSString *)[(NSString *)type copy];
      [(SCNLight *)self _resyncObjCModelOfPerTypeParameters];
      uint64_t v6 = [(SCNLight *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __20__SCNLight_setType___block_invoke;
      v8[3] = &unk_264005010;
      v8[4] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

void __20__SCNLight_setType___block_invoke(uint64_t a1)
{
  int v2 = SCNLightTypeToC3DLightType(*(void **)(*(void *)(a1 + 32) + 48));
  C3DLightSetType(*(void *)(*(void *)(a1 + 32) + 8), v2);
  if (v2 == 6)
  {
    SCNLightType v3 = *(float32x4_t **)(a1 + 32);
    uint64_t v4 = v3->i64[1];
    uint64_t v5 = v3[21].i64[0];
    float32x4_t v6 = v3[22];
    CGSize v7 = (void *)v3[23].i64[0];
    _SCNLightUpdateC3DLightDescription(v4, v5, v7, v6);
  }
}

- (BOOL)usesDeferredShadows
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    uint64_t v5 = [(SCNLight *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char UsesDeferredShadows = C3DLightGetUsesDeferredShadows((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesDeferredShadows;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetUsesDeferredShadows((uint64_t)light);
    }
  }
  else
  {
    return (v2 >> 2) & 1;
  }
  return v3;
}

- (void)setUsesDeferredShadows:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setUsesDeferredShadows:]();
    }
  }
  else if (((((v4 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xFB | v6;
    CGSize v7 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __35__SCNLight_setUsesDeferredShadows___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = a3;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __35__SCNLight_setUsesDeferredShadows___block_invoke(uint64_t a1)
{
}

- (BOOL)usesModulatedMode
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    uint64_t v5 = [(SCNLight *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char UsesModulatedMode = C3DLightGetUsesModulatedMode((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesModulatedMode;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetUsesModulatedMode((uint64_t)light);
    }
  }
  else
  {
    return (v2 >> 3) & 1;
  }
  return v3;
}

- (void)setUsesModulatedMode:(BOOL)a3
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    double v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setUsesModulatedMode:]();
    }
  }
  else if (((((v4 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xF7 | v6;
    CGSize v7 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__SCNLight_setUsesModulatedMode___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = a3;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __33__SCNLight_setUsesModulatedMode___block_invoke(uint64_t a1)
{
}

- (CGFloat)zFar
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zFar;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double ZFar = C3DLightGetZFar((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return ZFar;
  }
  else
  {
    light = self->_light;
    return C3DLightGetZFar((uint64_t)light);
  }
}

- (void)setZFar:(CGFloat)zFar
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setZFar:]();
    }
  }
  else if (self->_zFar != zFar)
  {
    self->_zFar = zFar;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __20__SCNLight_setZFar___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = zFar;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"zFar" applyBlock:v7];
  }
}

void __20__SCNLight_setZFar___block_invoke(uint64_t a1)
{
}

- (CGFloat)zNear
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zNear;
  }
  char v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double ZNear = C3DLightGetZNear((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return ZNear;
  }
  else
  {
    light = self->_light;
    return C3DLightGetZNear((uint64_t)light);
  }
}

- (void)setZNear:(CGFloat)zNear
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setZNear:]();
    }
  }
  else if (self->_zNear != zNear)
  {
    self->_zNear = zNear;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __21__SCNLight_setZNear___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = zNear;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"zNear" applyBlock:v7];
  }
}

void __21__SCNLight_setZNear___block_invoke(uint64_t a1)
{
}

- (NSUInteger)shadowCascadeCount
{
  if (*((unsigned char *)self + 16))
  {
    char v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      unsigned int ShadowCascadeCount = C3DLightGetShadowCascadeCount((uint64_t)self->_light);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DLightGetShadowCascadeCount((uint64_t)self->_light);
    }
  }
  else
  {
    return self->_shadowCascadeCount;
  }
  return ShadowCascadeCount;
}

- (void)setShadowCascadeCount:(NSUInteger)shadowCascadeCount
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowCascadeCount:]();
    }
  }
  else if (self->_shadowCascadeCount != shadowCascadeCount)
  {
    if ((shadowCascadeCount & 0xFC) != 0) {
      unsigned __int8 v4 = 4;
    }
    else {
      unsigned __int8 v4 = shadowCascadeCount;
    }
    self->_shadowCascadeCount = v4;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNLight_setShadowCascadeCount___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    unsigned __int8 v8 = v4;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __34__SCNLight_setShadowCascadeCount___block_invoke(uint64_t a1)
{
}

- (BOOL)automaticallyAdjustsShadowProjection
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    uint64_t v5 = [(SCNLight *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char AutomaticallyAdjustsShadowProjection = C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)self->_light);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = AutomaticallyAdjustsShadowProjection;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetAutomaticallyAdjustsShadowProjection((uint64_t)light);
    }
  }
  else
  {
    return v2 >> 7;
  }
  return v3;
}

- (void)setAutomaticallyAdjustsShadowProjection:(BOOL)automaticallyAdjustsShadowProjection
{
  unsigned int v4 = *((unsigned __int8 *)self + 16);
  if (v4)
  {
    unsigned __int8 v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setAutomaticallyAdjustsShadowProjection:]();
    }
  }
  else if (automaticallyAdjustsShadowProjection != v4 >> 7)
  {
    if (automaticallyAdjustsShadowProjection) {
      char v6 = 0x80;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v6 & 0x80 | v4 & 0x7F;
    CGSize v7 = [(SCNLight *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__SCNLight_setAutomaticallyAdjustsShadowProjection___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = automaticallyAdjustsShadowProjection;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __52__SCNLight_setAutomaticallyAdjustsShadowProjection___block_invoke(uint64_t a1)
{
}

- (CGFloat)maximumShadowDistance
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_maximumShadowDistance;
  }
  unsigned int v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DMeshElementGetPointSize((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double PointSize = C3DMeshElementGetPointSize((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return PointSize;
}

- (void)setMaximumShadowDistance:(CGFloat)maximumShadowDistance
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setMaximumShadowDistance:]();
    }
  }
  else
  {
    CGFloat v4 = maximumShadowDistance;
    LOBYTE(maximumShadowDistance) = self->_shadowCascadeCount;
    if ((double)*(unint64_t *)&maximumShadowDistance != v4)
    {
      self->_maximumShadowDistance = v4;
      uint64_t v5 = [(SCNLight *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __37__SCNLight_setMaximumShadowDistance___block_invoke;
      v7[3] = &unk_264004FC0;
      v7[4] = self;
      *(CGFloat *)&void v7[5] = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

float __37__SCNLight_setMaximumShadowDistance___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetMaximumShadowDistance(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (BOOL)forcesBackFaceCasters
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *((unsigned char *)self + 17) & 1;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char ForceCasterBackFaceOnly = C3DLightGetForceCasterBackFaceOnly((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return ForceCasterBackFaceOnly;
  }
  else
  {
    light = self->_light;
    return C3DLightGetForceCasterBackFaceOnly((uint64_t)light);
  }
}

- (void)setForcesBackFaceCasters:(BOOL)forcesBackFaceCasters
{
  if (*((unsigned char *)self + 16))
  {
    CGSize v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setForcesBackFaceCasters:]();
    }
  }
  else
  {
    char v5 = *((unsigned char *)self + 17);
    if (((((v5 & 1) == 0) ^ forcesBackFaceCasters) & 1) == 0)
    {
      *((unsigned char *)self + 17) = v5 & 0xFE | forcesBackFaceCasters;
      char v6 = [(SCNLight *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      void v8[2] = __37__SCNLight_setForcesBackFaceCasters___block_invoke;
      v8[3] = &unk_264004FE8;
      v8[4] = self;
      BOOL v9 = forcesBackFaceCasters;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v8];
    }
  }
}

void __37__SCNLight_setForcesBackFaceCasters___block_invoke(uint64_t a1)
{
}

- (BOOL)sampleDistributedShadowMaps
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      char EnableSampleDistributed = C3DLightGetEnableSampleDistributed((uint64_t)self->_light);
      C3DSceneUnlock(v5);
      LOBYTE(v3) = EnableSampleDistributed;
    }
    else
    {
      light = self->_light;
      LOBYTE(v3) = C3DLightGetEnableSampleDistributed((uint64_t)light);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 17) >> 1) & 1;
  }
  return v3;
}

- (void)setSampleDistributedShadowMaps:(BOOL)sampleDistributedShadowMaps
{
  if (*((unsigned char *)self + 16))
  {
    unsigned __int8 v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setSampleDistributedShadowMaps:]();
    }
  }
  else
  {
    char v5 = *((unsigned char *)self + 17);
    if (((((v5 & 2) == 0) ^ sampleDistributedShadowMaps) & 1) == 0)
    {
      if (sampleDistributedShadowMaps) {
        char v6 = 2;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 17) = v5 & 0xFD | v6;
      CGSize v7 = [(SCNLight *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__SCNLight_setSampleDistributedShadowMaps___block_invoke;
      v9[3] = &unk_264004FE8;
      v9[4] = self;
      BOOL v10 = sampleDistributedShadowMaps;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
    }
  }
}

void __43__SCNLight_setSampleDistributedShadowMaps___block_invoke(uint64_t a1)
{
}

- (CGFloat)shadowCascadeSplittingFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_shadowCascadeSplittingFactor;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ShadowCascadeSplittingFactor = C3DLightGetShadowCascadeSplittingFactor((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowCascadeSplittingFactor;
}

- (void)setShadowCascadeSplittingFactor:(CGFloat)shadowCascadeSplittingFactor
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight setShadowCascadeSplittingFactor:]();
    }
  }
  else if (self->_shadowCascadeSplittingFactor != shadowCascadeSplittingFactor)
  {
    self->_shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SCNLight_setShadowCascadeSplittingFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&void v7[5] = shadowCascadeSplittingFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

float __44__SCNLight_setShadowCascadeSplittingFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetShadowCascadeSplittingFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (double)_shadowCascadeDebugFactor
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_cascadeDebugFactor;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return C3DLightGetShadowCascadeDebugFactor((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ShadowCascadeDebugFactor = C3DLightGetShadowCascadeDebugFactor((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ShadowCascadeDebugFactor;
}

- (void)set_shadowCascadeDebugFactor:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNLight set_shadowCascadeDebugFactor:]();
    }
  }
  else if (self->_cascadeDebugFactor != a3)
  {
    self->_cascadeDebugFactor = a3;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __41__SCNLight_set_shadowCascadeDebugFactor___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self keyPath:@"shadowCascadeDebugFactor" applyBlock:v7];
  }
}

float __41__SCNLight_set_shadowCascadeDebugFactor___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DLightSetShadowCascadeDebugFactor(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (SCNShadowMode)shadowMode
{
  if ([(SCNLight *)self usesDeferredShadows]) {
    return 1;
  }
  if ([(SCNLight *)self usesModulatedMode]) {
    return 2;
  }
  return 0;
}

- (void)setShadowMode:(SCNShadowMode)shadowMode
{
  [(SCNLight *)self setUsesDeferredShadows:shadowMode == SCNShadowModeDeferred];

  [(SCNLight *)self setUsesModulatedMode:shadowMode == SCNShadowModeModulated];
}

- (SCNLightProbeType)probeType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_probeType;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DLightGetProbeType((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  Probeint Type = (unint64_t)C3DLightGetProbeType((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ProbeType;
}

- (void)setProbeType:(SCNLightProbeType)probeType
{
  if (self->_probeType != probeType)
  {
    self->_probeint Type = probeType;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__SCNLight_setProbeType___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    v6[5] = probeType;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __25__SCNLight_setProbeType___block_invoke(uint64_t a1)
{
}

- (SCNLightProbeUpdateType)probeUpdateType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_probeUpdateType;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (!v4) {
    return (unint64_t)C3DLightGetProbeUpdateType((uint64_t)self->_light);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  ProbeUpdateint Type = (unint64_t)C3DLightGetProbeUpdateType((uint64_t)self->_light);
  C3DSceneUnlock(v5);
  return ProbeUpdateType;
}

- (void)setProbeUpdateType:(SCNLightProbeUpdateType)probeUpdateType
{
  if (self->_probeUpdateType != probeUpdateType)
  {
    self->_probeUpdateint Type = probeUpdateType;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __31__SCNLight_setProbeUpdateType___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    v6[5] = probeUpdateType;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __31__SCNLight_setProbeUpdateType___block_invoke(uint64_t a1)
{
}

- (BOOL)parallaxCorrectionEnabled
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_parallaxCorrectionEnabled;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    BOOL ParallaxCorrectionEnabled = C3DLightGetParallaxCorrectionEnabled((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return ParallaxCorrectionEnabled;
  }
  else
  {
    light = self->_light;
    return C3DLightGetParallaxCorrectionEnabled((uint64_t)light);
  }
}

- (void)setParallaxCorrectionEnabled:(BOOL)parallaxCorrectionEnabled
{
  if (self->_parallaxCorrectionEnabled != parallaxCorrectionEnabled)
  {
    self->_parallaxCorrectionEnabled = parallaxCorrectionEnabled;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__SCNLight_setParallaxCorrectionEnabled___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = parallaxCorrectionEnabled;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __41__SCNLight_setParallaxCorrectionEnabled___block_invoke(uint64_t a1)
{
}

- (simd_float3)parallaxCenterOffset
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      __n128 ParallaxCenterOffset = C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ParallaxCenterOffset;
    }
    else
    {
      return (simd_float3)C3DLightGetParallaxCenterOffset((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_parallaxCenterOffset[7];
  }
}

- (void)setParallaxCenterOffset:(simd_float3)parallaxCenterOffset
{
  uint32x4_t v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxCenterOffset[7], (float32x4_t)parallaxCenterOffset));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_parallaxCenterOffset[7] = parallaxCenterOffset;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNLight_setParallaxCenterOffset___block_invoke;
    v7[3] = &unk_2640083D8;
    BOOL v9 = self;
    simd_float3 v8 = parallaxCenterOffset;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __36__SCNLight_setParallaxCenterOffset___block_invoke(__n128 *a1)
{
}

- (simd_float3)parallaxExtentsFactor
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      __n128 ParallaxExtentsFactor = C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ParallaxExtentsFactor;
    }
    else
    {
      return (simd_float3)C3DLightGetParallaxExtentsFactor((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_parallaxExtentsFactor[7];
  }
}

- (void)setParallaxExtentsFactor:(simd_float3)parallaxExtentsFactor
{
  uint32x4_t v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_parallaxExtentsFactor[7], (float32x4_t)parallaxExtentsFactor));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_parallaxExtentsFactor[7] = parallaxExtentsFactor;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNLight_setParallaxExtentsFactor___block_invoke;
    v7[3] = &unk_2640083D8;
    BOOL v9 = self;
    simd_float3 v8 = parallaxExtentsFactor;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __37__SCNLight_setParallaxExtentsFactor___block_invoke(__n128 *a1)
{
}

- (simd_float3)probeExtents
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      __n128 ProbeExtents = C3DLightGetProbeExtents((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ProbeExtents;
    }
    else
    {
      return (simd_float3)C3DLightGetProbeExtents((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_probeExtents[7];
  }
}

- (void)setProbeExtents:(simd_float3)probeExtents
{
  uint32x4_t v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeExtents[7], (float32x4_t)probeExtents));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_probeExtents[7] = probeExtents;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNLight_setProbeExtents___block_invoke;
    v7[3] = &unk_2640083D8;
    BOOL v9 = self;
    simd_float3 v8 = probeExtents;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

double __28__SCNLight_setProbeExtents___block_invoke(float32x4_t *a1)
{
  *(void *)&double result = C3DLightSetProbeExtents((float32x4_t *)*(void *)(a1[3].i64[0] + 8), a1[2]).u64[0];
  return result;
}

- (simd_float3)probeOffset
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      __n128 ProbeOffset = C3DLightGetProbeOffset((__n128 *)self->_light);
      C3DSceneUnlock(v5);
      return (simd_float3)ProbeOffset;
    }
    else
    {
      return (simd_float3)C3DLightGetProbeOffset((__n128 *)self->_light);
    }
  }
  else
  {
    return *(simd_float3 *)&self->_probeOffset[7];
  }
}

- (void)setProbeOffset:(simd_float3)probeOffset
{
  uint32x4_t v3 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self->_probeOffset[7], (float32x4_t)probeOffset));
  v3.i32[3] = v3.i32[2];
  if ((vmaxvq_u32(v3) & 0x80000000) != 0)
  {
    *(simd_float3 *)&self->_probeOffset[7] = probeOffset;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __27__SCNLight_setProbeOffset___block_invoke;
    v7[3] = &unk_2640083D8;
    BOOL v9 = self;
    simd_float3 v8 = probeOffset;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __27__SCNLight_setProbeOffset___block_invoke(__n128 *a1)
{
}

- (SCNMaterialProperty)probeEnvironment
{
  double result = self->_probeEnvironment;
  if (!result)
  {
    double result = [[SCNMaterialProperty alloc] initWithParent:self propertyType:25];
    self->_probeEnvironment = result;
  }
  if (*((unsigned char *)self + 16))
  {
    return (SCNMaterialProperty *)[(SCNMaterialProperty *)result presentationMaterialProperty];
  }
  return result;
}

- (SCNLightAreaType)areaType
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_areaType;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    C3DLightGetAreaDescription((uint64_t)self->_light, v7);
    SCNLightAreaType v3 = (unint64_t)LOBYTE(v7[0]);
    C3DSceneUnlock(v5);
  }
  else
  {
    C3DLightGetAreaDescription((uint64_t)self->_light, v7);
    return (unint64_t)LOBYTE(v7[0]);
  }
  return v3;
}

- (void)setAreaType:(SCNLightAreaType)areaType
{
  if (self->_areaType != areaType)
  {
    self->_areaint Type = areaType;
    CGFloat v4 = [(SCNLight *)self sceneRef];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __24__SCNLight_setAreaType___block_invoke;
    v5[3] = &unk_264005010;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
  }
}

void __24__SCNLight_setAreaType___block_invoke(uint64_t a1)
{
}

- (simd_float3)areaExtents
{
  if (*((unsigned char *)self + 16))
  {
    CGFloat v4 = [(SCNLight *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    C3DLightGetAreaDescription((uint64_t)self->_light, &v12);
    switch((char)v12)
    {
      case 0:
        v6.i64[1] = 0x3F0000003F000000;
        v6.i64[0] = v13.u32[0] | 0x3F00000000000000;
        goto LABEL_11;
      case 1:
      case 2:
        float32x4_t v6 = v13;
        v6.i32[2] = 0.5;
        goto LABEL_11;
      case 3:
        float32x4_t v6 = v13;
LABEL_11:
        simd_float3 result = (simd_float3)vaddq_f32(v6, v6);
        if (v5) {
          goto LABEL_12;
        }
        return result;
      default:
        __asm { FMOV            V0.4S, #1.0; jumptable 000000020B3D3CD0 default case }
        if (!v5) {
          return result;
        }
LABEL_12:
        simd_float3 v11 = result;
        C3DSceneUnlock(v5);
        simd_float3 result = v11;
        break;
    }
  }
  else
  {
    return *(simd_float3 *)self->_areaExtents;
  }
  return result;
}

- (void)setAreaExtents:(simd_float3)areaExtents
{
  uint32x4_t v3 = (uint32x4_t)vceqq_f32(*(float32x4_t *)self->_areaExtents, (float32x4_t)areaExtents);
  v3.i32[3] = v3.i32[2];
  if ((vminvq_u32(v3) & 0x80000000) == 0)
  {
    *(simd_float3 *)self->_areaExtents = areaExtents;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__SCNLight_setAreaExtents___block_invoke;
    v6[3] = &unk_264005010;
    v6[4] = self;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __27__SCNLight_setAreaExtents___block_invoke(uint64_t a1)
{
}

- (BOOL)drawsArea
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_drawsArea;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char DrawsArea = C3DLightGetDrawsArea((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return DrawsArea;
  }
  else
  {
    light = self->_light;
    return C3DLightGetDrawsArea((uint64_t)light);
  }
}

- (void)setDrawsArea:(BOOL)drawsArea
{
  if (self->_drawsArea != drawsArea)
  {
    self->_drawsArea = drawsArea;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__SCNLight_setDrawsArea___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = drawsArea;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __25__SCNLight_setDrawsArea___block_invoke(uint64_t a1)
{
}

- (BOOL)doubleSided
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_doubleSided;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char DoubleSided = C3DLightGetDoubleSided((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return DoubleSided;
  }
  else
  {
    light = self->_light;
    return C3DLightGetDoubleSided((uint64_t)light);
  }
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  if (self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    uint64_t v5 = [(SCNLight *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__SCNLight_setDoubleSided___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = doubleSided;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __27__SCNLight_setDoubleSided___block_invoke(uint64_t a1, float32x4_t a2, float32x4_t a3, double a4, double a5, double a6, double a7, __n128 a8)
{
}

- (NSArray)areaPolygonVertices
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_areaPolygonVertices;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  long long v8 = 0u;
  long long v9 = 0u;
  C3DLightGetAreaDescription((uint64_t)self->_light, &v8);
  v7[0] = v8;
  v7[1] = v9;
  uint32x4_t v3 = (NSArray *)_SCNAreaLightpolygonVerticesFromDescription((uint64_t)v7);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return v3;
}

- (void)setAreaPolygonVertices:(NSArray *)areaPolygonVertices
{
  uint32x4_t v3 = self->_areaPolygonVertices;
  if (v3 != areaPolygonVertices)
  {

    self->_areaPolygonVertices = (NSArray *)[(NSArray *)areaPolygonVertices copy];
    float32x4_t v6 = [(SCNLight *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    _OWORD v7[2] = __35__SCNLight_setAreaPolygonVertices___block_invoke;
    v7[3] = &unk_264005010;
    void v7[4] = self;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __35__SCNLight_setAreaPolygonVertices___block_invoke(uint64_t a1)
{
}

- (BOOL)hasGobo
{
  return self->_gobo != 0;
}

- (SCNMaterialProperty)gobo
{
  simd_float3 result = self->_gobo;
  if (!result)
  {
    simd_float3 result = [[SCNMaterialProperty alloc] initWithParent:self propertyType:22];
    self->_gobo = result;
  }
  if (*((unsigned char *)self + 16))
  {
    return (SCNMaterialProperty *)[(SCNMaterialProperty *)result presentationMaterialProperty];
  }
  return result;
}

- (NSURL)IESProfileURL
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_IESProfileURL;
  }
  CGFloat v4 = [(SCNLight *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    IESProfileURL = (NSURL *)C3DLightGetIESProfileURL((uint64_t)self->_light);
    C3DSceneUnlock(v5);
    return IESProfileURL;
  }
  else
  {
    light = self->_light;
    return (NSURL *)C3DLightGetIESProfileURL((uint64_t)light);
  }
}

- (void)setIESProfileURL:(id)a3 resolvedURL:(id)a4
{
  self->_IESProfileURL = (NSURL *)[a3 copy];
  +[SCNTransaction postCommandWithContext:object:applyBlock:](SCNTransaction, "postCommandWithContext:object:applyBlock:", [(SCNLight *)self sceneRef], self);
}

void __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke(uint64_t a1)
{
  C3DLightSetType(*(void *)(*(void *)(a1 + 32) + 8), 5);
  unsigned int v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);

  C3DLightSetIESProfileURL(v3, v2);
}

void __41__SCNLight_setIESProfileURL_resolvedURL___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 8);
  int v3 = SCNLightTypeToC3DLightType(*(void **)(v1 + 48));

  C3DLightSetType(v2, v3);
}

- (void)setIESProfileURL:(NSURL *)IESProfileURL
{
  if (IESProfileURL)
  {
    BOOL v5 = [(NSURL *)IESProfileURL isFileURL];
    float32x4_t v6 = IESProfileURL;
    if (v5)
    {
      BOOL v7 = [(NSURL *)IESProfileURL relativePath];
      if (![(NSString *)v7 isAbsolutePath])
      {
        BOOL v8 = SCNHasSpecialResourceBundle();
        long long v9 = (void *)SCNGetResourceBundle();
        if (v8) {
          BOOL v10 = (void *)[v9 bundlePath];
        }
        else {
          BOOL v10 = (void *)[v9 resourcePath];
        }
        BOOL v7 = (NSString *)[v10 stringByAppendingPathComponent:v7];
      }
      float32x4_t v6 = IESProfileURL;
      if (v7) {
        float32x4_t v6 = (NSURL *)objc_msgSend(NSURL, "fileURLWithPath:", v7, IESProfileURL);
      }
    }
  }
  else
  {
    float32x4_t v6 = 0;
  }

  [(SCNLight *)self setIESProfileURL:IESProfileURL resolvedURL:v6];
}

- (void)_customEncodingOfSCNLight:(id)a3
{
  [(SCNLight *)self attenuationStartDistance];
  *(float *)&double v5 = v5;
  [a3 encodeFloat:@"attenuationStartDistance" forKey:v5];
  [(SCNLight *)self attenuationEndDistance];
  *(float *)&double v6 = v6;
  [a3 encodeFloat:@"attenuationEndDistance" forKey:v6];
  [(SCNLight *)self attenuationFalloffExponent];
  *(float *)&double v7 = v7;
  [a3 encodeFloat:@"attenuationFalloffExponent" forKey:v7];
  [(SCNLight *)self spotInnerAngle];
  *(float *)&double v8 = v8;
  [a3 encodeFloat:@"spotInnerAngle" forKey:v8];
  [(SCNLight *)self spotOuterAngle];
  *(float *)&double v9 = v9;
  [a3 encodeFloat:@"spotOuterAngle" forKey:v9];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 2) & 1 forKey:@"usesDeferredShadows"];
  [a3 encodeInteger:self->_categoryBitMask forKey:@"lightCategoryBitMask"];
  LODWORD(v10) = *((_DWORD *)&self->_spotFalloffExponent + 1);
  [a3 encodeFloat:@"spotFallOffExponent" forKey:v10];
  if ([(NSString *)self->_type isEqualToString:@"probe"])
  {
    [a3 encodeInt:LODWORD(self->_probeType) forKey:@"probeType"];
    [a3 encodeInt:LODWORD(self->_probeUpdateType) forKey:@"probeUpdateType"];
    [a3 encodeBool:self->_parallaxCorrectionEnabled forKey:@"parallaxCorrectionEnabled"];
    LODWORD(v11) = *(_DWORD *)&self->_probeExtents[7];
    [a3 encodeFloat:@"probeExtentsX" forKey:v11];
    LODWORD(v12) = *(_DWORD *)&self->_probeExtents[11];
    [a3 encodeFloat:@"probeExtentsY" forKey:v12];
    LODWORD(v13) = *(_DWORD *)&self->_probeExtents[15];
    [a3 encodeFloat:@"probeExtentsZ" forKey:v13];
    if (COERCE_FLOAT(*(_OWORD *)&self->_probeOffset[7]) == 0.0)
    {
      LODWORD(v14) = HIDWORD(*(void *)&self->_probeOffset[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", @"probeOffsetX");
      float v14 = *(float *)&self->_probeOffset[11];
    }
    if (v14 != 0.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"probeOffsetY");
    }
    if (*(float *)&self->_probeOffset[15] != 0.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"probeOffsetZ");
    }
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxCenterOffset[7]) == 0.0)
    {
      LODWORD(v15) = HIDWORD(*(void *)&self->_parallaxCenterOffset[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxOffsetX");
      float v15 = *(float *)&self->_parallaxCenterOffset[11];
    }
    if (v15 != 0.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxOffsetY");
    }
    if (*(float *)&self->_parallaxCenterOffset[15] != 0.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxOffsetZ");
    }
    if (COERCE_FLOAT(*(_OWORD *)&self->_parallaxExtentsFactor[7]) == 1.0)
    {
      LODWORD(v16) = HIDWORD(*(void *)&self->_parallaxExtentsFactor[7]);
    }
    else
    {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxExtentsFactorX");
      float v16 = *(float *)&self->_parallaxExtentsFactor[11];
    }
    if (v16 != 1.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxExtentsFactorY");
    }
    if (*(float *)&self->_parallaxExtentsFactor[15] != 1.0) {
      objc_msgSend(a3, "encodeFloat:forKey:", @"parallaxExtentsFactorZ");
    }
  }
  double maximumShadowDistance = self->_maximumShadowDistance;
  *(float *)&double maximumShadowDistance = maximumShadowDistance;
  [a3 encodeFloat:@"maximumShadowDistance" forKey:maximumShadowDistance];
  [a3 encodeBool:*((unsigned __int8 *)self + 16) >> 7 forKey:@"autoShadowProjection"];
  [a3 encodeInt:self->_shadowCascadeCount forKey:@"shadowCascadeCount"];
  double shadowCascadeSplittingFactor = self->_shadowCascadeSplittingFactor;
  *(float *)&double shadowCascadeSplittingFactor = shadowCascadeSplittingFactor;
  [a3 encodeFloat:@"shadowCascadeSplittingFactor" forKey:shadowCascadeSplittingFactor];
  [a3 encodeBool:*((unsigned char *)self + 17) & 1 forKey:@"forcesBackFaceCasters"];
  [a3 encodeBool:(*((unsigned __int8 *)self + 17) >> 1) & 1 forKey:@"sampleDistributedShadowMaps"];

  [a3 encodeInt32:1 forKey:@"version"];
}

- (void)_customDecodingOfSCNLight:(id)a3
{
  [a3 decodeFloatForKey:@"attenuationStartDistance"];
  [(SCNLight *)self setAttenuationStartDistance:v5];
  [a3 decodeFloatForKey:@"attenuationEndDistance"];
  [(SCNLight *)self setAttenuationEndDistance:v6];
  [a3 decodeFloatForKey:@"attenuationFalloffExponent"];
  [(SCNLight *)self setAttenuationFalloffExponent:v7];
  [a3 decodeFloatForKey:@"spotInnerAngle"];
  [(SCNLight *)self setSpotInnerAngle:v8];
  [a3 decodeFloatForKey:@"spotOuterAngle"];
  [(SCNLight *)self setSpotOuterAngle:v9];
  if ([a3 containsValueForKey:@"maximumShadowDistance"])
  {
    [a3 decodeFloatForKey:@"maximumShadowDistance"];
    [(SCNLight *)self setMaximumShadowDistance:v10];
  }
  if ([a3 containsValueForKey:@"autoShadowProjection"]) {
    -[SCNLight setAutomaticallyAdjustsShadowProjection:](self, "setAutomaticallyAdjustsShadowProjection:", [a3 decodeBoolForKey:@"autoShadowProjection"]);
  }
  if ([a3 containsValueForKey:@"forcesBackFaceCasters"]) {
    -[SCNLight setForcesBackFaceCasters:](self, "setForcesBackFaceCasters:", [a3 decodeBoolForKey:@"forcesBackFaceCasters"]);
  }
  if ([a3 containsValueForKey:@"sampleDistributedShadowMaps"]) {
    -[SCNLight setSampleDistributedShadowMaps:](self, "setSampleDistributedShadowMaps:", [a3 decodeBoolForKey:@"sampleDistributedShadowMaps"]);
  }
  if ([a3 containsValueForKey:@"shadowCascadeCount"]) {
    -[SCNLight setShadowCascadeCount:](self, "setShadowCascadeCount:", (int)[a3 decodeIntForKey:@"shadowCascadeCount"]);
  }
  if ([a3 containsValueForKey:@"shadowCascadeSplittingFactor"])
  {
    [a3 decodeFloatForKey:@"shadowCascadeSplittingFactor"];
    [(SCNLight *)self setShadowCascadeSplittingFactor:v11];
  }
  if ([a3 containsValueForKey:@"spotFallOffExponent"])
  {
    [a3 decodeFloatForKey:@"spotFallOffExponent"];
    [(SCNLight *)self setSpotFalloffExponent:v12];
  }
  if ([a3 containsValueForKey:@"usesDeferredShadows"]) {
    -[SCNLight setUsesDeferredShadows:](self, "setUsesDeferredShadows:", [a3 decodeIntForKey:@"usesDeferredShadows"] != 0);
  }
  if ([a3 containsValueForKey:@"lightCategoryBitMask"])
  {
    uint64_t v13 = [a3 decodeIntegerForKey:@"lightCategoryBitMask"];
    [(SCNLight *)self setCategoryBitMask:v13];
  }
}

- (void)_didDecodeSCNLight:(id)a3
{
  if (![a3 decodeInt32ForKey:@"version"] && self->_shadowSampleCount == 16)
  {
    [(SCNLight *)self setShadowSampleCount:1];
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    [(SCNLight *)self _syncObjCModel];
  }
  [(SCNLight *)self _customEncodingOfSCNLight:a3];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 1) & 1 forKey:@"castsShadow"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 3) & 1 forKey:@"usesModulatedMode"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 4) & 1 forKey:@"baked"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 5) & 1 forKey:@"shouldBakeDirectLighting"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 6) & 1 forKey:@"shouldBakeIndirectLighting"];
  sphericalHarmonics = self->_sphericalHarmonics;
  if (sphericalHarmonics) {
    [a3 encodeObject:sphericalHarmonics forKey:@"sphericalHarmonics"];
  }
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  type = self->_type;
  if (type) {
    [a3 encodeObject:type forKey:@"type"];
  }
  id color = self->_color;
  if (color)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)color, @"color");
    SCNEncodeColor(a3, self->_color, @"scncolor");
  }
  shadowuint64_t Color = self->_shadowColor;
  if (shadowColor)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)shadowColor, @"shadowColor");
    SCNEncodeColor(a3, self->_shadowColor, @"scnShadowColor");
  }
  *(float *)&double v5 = self->_shadowRadius;
  [a3 encodeFloat:@"shadowRadius" forKey:v5];
  [a3 encodeDouble:@"intensity" forKey:self->_intensity];
  [a3 encodeDouble:@"temperature" forKey:self->_temperature];
  [a3 encodeDouble:@"orthographicScale" forKey:self->_orthographicScale];
  if (self->_shadowSampleCount) {
    uint64_t shadowSampleCount = self->_shadowSampleCount;
  }
  else {
    uint64_t shadowSampleCount = 16;
  }
  [a3 encodeInteger:shadowSampleCount forKey:@"shadowSampleCount"];
  [a3 encodeInteger:self->_shadowSampleCount forKey:@"shadowSampleCount2"];
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->_shadowMapSize.width, self->_shadowMapSize.height), @"shadowMapSize");
  [a3 encodeDouble:@"zNear" forKey:self->_zNear];
  [a3 encodeDouble:@"zFar" forKey:self->_zFar];
  [a3 encodeDouble:@"shadowBias" forKey:self->_shadowBias];
  gobo = self->_gobo;
  if (gobo) {
    [a3 encodeObject:gobo forKey:@"gobo"];
  }
  IESProfileURL = self->_IESProfileURL;
  if (IESProfileURL) {
    [a3 encodeObject:IESProfileURL forKey:@"IESProfileURL"];
  }
  technique = self->_technique;
  if (technique) {
    [a3 encodeObject:technique forKey:@"technique"];
  }
  [a3 encodeInteger:self->_areaType forKey:@"areaType"];
  LODWORD(v15) = *(_DWORD *)self->_areaExtents;
  [a3 encodeFloat:@"areaExtentsX" forKey:v15];
  LODWORD(v16) = *(_DWORD *)&self->_areaExtents[4];
  [a3 encodeFloat:@"areaExtentsY" forKey:v16];
  LODWORD(v17) = *(_DWORD *)&self->_areaExtents[8];
  [a3 encodeFloat:@"areaExtentsZ" forKey:v17];
  [a3 encodeObject:self->_areaPolygonVertices forKey:@"areaPolygonVertices"];
  [a3 encodeBool:self->_drawsArea forKey:@"drawsArea"];
  [a3 encodeBool:self->_doubleSided forKey:@"doubleSided"];
  probeEnvironment = self->_probeEnvironment;
  if (probeEnvironment) {
    [a3 encodeObject:probeEnvironment forKey:@"probeEnvironment"];
  }
  SCNEncodeEntity(a3, self);

  SCNEncodeAnimations(a3, self);
}

- (SCNLight)initWithCoder:(id)a3
{
  v45.receiver = self;
  v45.super_class = (Class)SCNLight;
  CGFloat v4 = [(SCNLight *)&v45 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = C3DLightCreate();
    v4->_light = (__C3DLight *)v6;
    if (v6) {
      C3DEntitySetObjCWrapper(v6, v4);
    }
    [(SCNLight *)v4 _syncObjCModel];
    -[SCNLight setType:](v4, "setType:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"type"]);
    [(SCNLight *)v4 _customDecodingOfSCNLight:a3];
    -[SCNLight setCastsShadow:](v4, "setCastsShadow:", [a3 decodeIntForKey:@"castsShadow"] != 0);
    -[SCNLight setUsesModulatedMode:](v4, "setUsesModulatedMode:", [a3 decodeIntForKey:@"usesModulatedMode"] != 0);
    -[SCNLight setBaked:](v4, "setBaked:", [a3 decodeIntForKey:@"baked"] != 0);
    -[SCNLight setShouldBakeDirectLighting:](v4, "setShouldBakeDirectLighting:", [a3 decodeIntForKey:@"shouldBakeDirectLighting"] != 0);
    -[SCNLight setShouldBakeIndirectLighting:](v4, "setShouldBakeIndirectLighting:", [a3 decodeIntForKey:@"shouldBakeIndirectLighting"] != 0);
    -[SCNLight set_sphericalHarmonics:](v4, "set_sphericalHarmonics:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sphericalHarmonics"]);
    -[SCNLight setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    if ([(NSString *)v4->_type isEqualToString:@"probe"])
    {
      -[SCNLight setProbeType:](v4, "setProbeType:", (int)[a3 decodeIntForKey:@"probeType"]);
      -[SCNLight setProbeUpdateType:](v4, "setProbeUpdateType:", (int)[a3 decodeIntForKey:@"probeUpdateType"]);
      -[SCNLight setParallaxCorrectionEnabled:](v4, "setParallaxCorrectionEnabled:", [a3 decodeBoolForKey:@"parallaxCorrectionEnabled"]);
      [a3 decodeFloatForKey:@"probeExtentsX"];
      unsigned int v40 = v7;
      [a3 decodeFloatForKey:@"probeExtentsY"];
      unsigned int v36 = v8;
      [a3 decodeFloatForKey:@"probeExtentsZ"];
      [(SCNLight *)v4 setProbeExtents:COERCE_DOUBLE(__PAIR64__(v36, v40))];
      [a3 decodeFloatForKey:@"probeOffsetX"];
      unsigned int v41 = v9;
      [a3 decodeFloatForKey:@"probeOffsetX"];
      unsigned int v37 = v10;
      [a3 decodeFloatForKey:@"probeOffsetX"];
      [(SCNLight *)v4 setProbeOffset:COERCE_DOUBLE(__PAIR64__(v37, v41))];
      [a3 decodeFloatForKey:@"parallaxOffsetX"];
      unsigned int v42 = v11;
      [a3 decodeFloatForKey:@"parallaxOffsetY"];
      unsigned int v38 = v12;
      [a3 decodeFloatForKey:@"parallaxOffsetZ"];
      [(SCNLight *)v4 setParallaxCenterOffset:COERCE_DOUBLE(__PAIR64__(v38, v42))];
      if ([a3 containsValueForKey:@"parallaxExtentsFactorX"])
      {
        [a3 decodeFloatForKey:@"parallaxExtentsFactorX"];
        __asm { FMOV            V1.4S, #1.0 }
        LODWORD(_Q1) = v18;
        *(void *)&double v43 = _Q1;
      }
      else
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(void *)&double v43 = _Q0;
      }
      if ([a3 containsValueForKey:@"parallaxExtentsFactorY"])
      {
        [a3 decodeFloatForKey:@"parallaxExtentsFactorY"];
        *(void *)&double v43 = __PAIR64__(v20, LODWORD(v43));
      }
      if ([a3 containsValueForKey:@"parallaxExtentsFactorZ"]) {
        [a3 decodeFloatForKey:@"parallaxExtentsFactorZ"];
      }
      [(SCNLight *)v4 setParallaxExtentsFactor:v43];
    }
    if ([a3 containsValueForKey:@"scncolor"])
    {
      uint64_t v21 = SCNDecodeColor(a3, @"scncolor");
    }
    else
    {
      double v22 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      uint64_t v21 = SCNDecodeUnsafeObjectForKey(a3, @"color", v22);
    }
    [(SCNLight *)v4 setColor:v21];
    if ([a3 containsValueForKey:@"scnShadowColor"])
    {
      uint64_t v23 = SCNDecodeColor(a3, @"scnShadowColor");
    }
    else
    {
      v24 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      uint64_t v23 = SCNDecodeUnsafeObjectForKey(a3, @"shadowColor", v24);
    }
    [(SCNLight *)v4 setShadowColor:v23];
    [a3 decodeFloatForKey:@"shadowRadius"];
    [(SCNLight *)v4 setShadowRadius:v25];
    if ([a3 containsValueForKey:@"intensity"])
    {
      [a3 decodeDoubleForKey:@"intensity"];
      -[SCNLight setIntensity:](v4, "setIntensity:");
    }
    if ([a3 containsValueForKey:@"temperature"])
    {
      [a3 decodeDoubleForKey:@"temperature"];
      -[SCNLight setTemperature:](v4, "setTemperature:");
    }
    [a3 decodeDoubleForKey:@"orthographicScale"];
    -[SCNLight setOrthographicScale:](v4, "setOrthographicScale:");
    if ([a3 containsValueForKey:@"shadowSampleCount2"])
    {
      uint64_t v26 = [a3 decodeIntegerForKey:@"shadowSampleCount2"];
    }
    else
    {
      uint64_t v27 = [a3 decodeIntegerForKey:@"shadowSampleCount"];
      if (v27 == 16) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = v27;
      }
    }
    [(SCNLight *)v4 setShadowSampleCount:v26];
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"shadowMapSize"), "CGSizeValue");
    -[SCNLight setShadowMapSize:](v4, "setShadowMapSize:");
    [a3 decodeDoubleForKey:@"zNear"];
    -[SCNLight setZNear:](v4, "setZNear:");
    [a3 decodeDoubleForKey:@"zFar"];
    -[SCNLight setZFar:](v4, "setZFar:");
    [a3 decodeDoubleForKey:@"shadowBias"];
    -[SCNLight setShadowBias:](v4, "setShadowBias:");
    v4->_gobo = (SCNMaterialProperty *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"gobo"];
    v4->_probeEnvironment = (SCNMaterialProperty *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"probeEnvironment"];
    if ([a3 containsValueForKey:@"IESProfileURL"])
    {
      v28 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"IESProfileURL"];
      if ([v28 isFileURL]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (v29 = (void *)[v28 relativePath], (objc_msgSend(v29, "isAbsolutePath") & 1) == 0)
        && (uint64_t v30 = objc_msgSend((id)objc_msgSend(a3, "documentEnclosingURL"), "URLByAppendingPathComponent:", v29)) != 0)
      {
        [(SCNLight *)v4 setIESProfileURL:v28 resolvedURL:v30];
      }
      else
      {
        [(SCNLight *)v4 setIESProfileURL:v28];
      }
    }
    -[SCNLight setTechnique:](v4, "setTechnique:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"technique"]);
    if ([a3 containsValueForKey:@"areaType"])
    {
      -[SCNLight setAreaType:](v4, "setAreaType:", [a3 decodeIntegerForKey:@"areaType"]);
      [a3 decodeFloatForKey:@"areaExtentsX"];
      unsigned int v44 = v31;
      [a3 decodeFloatForKey:@"areaExtentsY"];
      unsigned int v39 = v32;
      [a3 decodeFloatForKey:@"areaExtentsZ"];
      [(SCNLight *)v4 setAreaExtents:COERCE_DOUBLE(__PAIR64__(v39, v44))];
      -[SCNLight setAreaPolygonVertices:](v4, "setAreaPolygonVertices:", objc_msgSend(a3, "scn_decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"areaPolygonVertices"));
      -[SCNLight setDrawsArea:](v4, "setDrawsArea:", [a3 decodeBoolForKey:@"drawsArea"]);
      uint64_t v33 = [a3 decodeBoolForKey:@"doubleSided"];
    }
    else
    {
      [(SCNLight *)v4 setAreaType:4];
      __asm { FMOV            V0.4S, #1.0 }
      [(SCNLight *)v4 setAreaExtents:*(double *)&_Q0];
      [(SCNLight *)v4 setAreaPolygonVertices:0];
      [(SCNLight *)v4 setDrawsArea:1];
      uint64_t v33 = 0;
    }
    [(SCNLight *)v4 setDoubleSided:v33];
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    [(SCNLight *)v4 _didDecodeSCNLight:a3];
    +[SCNTransaction setImmediateMode:v5];
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

- (void)setAttenuationEndDistance:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAttenuationFalloffExponent:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAttenuationStartDistance:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBaked:.cold.1()
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

- (void)setCategoryBitMask:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setColor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setOrthographicScale:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowBias:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowColor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowMapSize:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowSampleCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSpotFalloffExponent:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSpotInnerAngle:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSpotOuterAngle:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setTechnique:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setTemperature:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setType:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setUsesDeferredShadows:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setUsesModulatedMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setZFar:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setZNear:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowCascadeCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAutomaticallyAdjustsShadowProjection:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMaximumShadowDistance:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setForcesBackFaceCasters:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSampleDistributedShadowMaps:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShadowCascadeSplittingFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)set_shadowCascadeDebugFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end