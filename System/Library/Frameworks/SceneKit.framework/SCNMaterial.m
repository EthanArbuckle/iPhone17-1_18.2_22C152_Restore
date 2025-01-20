@interface SCNMaterial
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (SCNMaterial)material;
+ (SCNMaterial)materialWithColor:(id)a3;
+ (SCNMaterial)materialWithContents:(id)a3;
+ (SCNMaterial)materialWithMDLMaterial:(MDLMaterial *)mdlMaterial;
+ (SCNMaterial)materialWithMDLMaterial:(id)a3 options:(id)a4;
+ (SCNMaterial)materialWithMaterialRef:(__C3DMaterial *)a3;
+ (id)materialNamed:(id)a3;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)avoidsOverLighting;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isDoubleSided;
- (BOOL)isLitPerPixel;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)locksAmbientWithDiffuse;
- (BOOL)readsFromDepthBuffer;
- (BOOL)writesToDepthBuffer;
- (CGFloat)fresnelExponent;
- (CGFloat)shininess;
- (CGFloat)transparency;
- (Class)_materialPropertyClass;
- (NSArray)animationKeys;
- (NSDictionary)shaderModifiers;
- (NSNumber)minimumLanguageVersion;
- (NSString)description;
- (NSString)name;
- (SCNBlendMode)blendMode;
- (SCNColorMask)colorBufferWriteMask;
- (SCNCullMode)cullMode;
- (SCNFillMode)fillMode;
- (SCNLightingModel)lightingModelName;
- (SCNMaterial)init;
- (SCNMaterial)initWithCoder:(id)a3;
- (SCNMaterial)initWithMaterialRef:(__C3DMaterial *)a3;
- (SCNMaterialProperty)ambient;
- (SCNMaterialProperty)ambientOcclusion;
- (SCNMaterialProperty)clearCoat;
- (SCNMaterialProperty)clearCoatNormal;
- (SCNMaterialProperty)clearCoatRoughness;
- (SCNMaterialProperty)diffuse;
- (SCNMaterialProperty)displacement;
- (SCNMaterialProperty)emission;
- (SCNMaterialProperty)metalness;
- (SCNMaterialProperty)multiply;
- (SCNMaterialProperty)normal;
- (SCNMaterialProperty)reflective;
- (SCNMaterialProperty)roughness;
- (SCNMaterialProperty)selfIllumination;
- (SCNMaterialProperty)specular;
- (SCNMaterialProperty)transparent;
- (SCNProgram)program;
- (SCNTransparencyMode)transparencyMode;
- (__C3DAnimationManager)animationManager;
- (__C3DEffectCommonProfile)commonProfile;
- (__C3DMaterial)materialRef;
- (__C3DMaterial)materialRefCreateIfNeeded;
- (__C3DScene)sceneRef;
- (double)indexOfRefraction;
- (double)selfIlluminationOcclusion;
- (id)__shadableHelper;
- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9;
- (id)_property:(id *)a3;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)builtinProperties;
- (id)color;
- (id)contents;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customMaterialAttributeNames;
- (id)customMaterialAttributes;
- (id)customMaterialProperties;
- (id)customMaterialPropertyNames;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)identifier;
- (id)initPresentationMaterialWithMaterialRef:(__C3DMaterial *)a3;
- (id)presentationMaterial;
- (id)properties;
- (id)scene;
- (id)shaderModifiersArgumentsNames;
- (id)valueForUndefinedKey:(id)a3;
- (void)__CFObject;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customDecodingOfSCNMaterial:(id)a3;
- (void)_customEncodingOfSCNMaterial:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setupMaterialProperty:(id *)a3;
- (void)_setupShadableHelperIfNeeded;
- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setAvoidsOverLighting:(BOOL)a3;
- (void)setBlendMode:(SCNBlendMode)blendMode;
- (void)setColor:(id)a3;
- (void)setColorBufferWriteMask:(SCNColorMask)colorBufferWriteMask;
- (void)setContents:(id)a3;
- (void)setCullMode:(SCNCullMode)cullMode;
- (void)setDoubleSided:(BOOL)doubleSided;
- (void)setFillMode:(SCNFillMode)fillMode;
- (void)setFresnelExponent:(CGFloat)fresnelExponent;
- (void)setIdentifier:(id)a3;
- (void)setIndexOfRefraction:(double)a3;
- (void)setLightingModelName:(SCNLightingModel)lightingModelName;
- (void)setLitPerPixel:(BOOL)litPerPixel;
- (void)setLocksAmbientWithDiffuse:(BOOL)locksAmbientWithDiffuse;
- (void)setMinimumLanguageVersion:(id)a3;
- (void)setName:(NSString *)name;
- (void)setProgram:(id)a3;
- (void)setReadsFromDepthBuffer:(BOOL)readsFromDepthBuffer;
- (void)setSelfIlluminationOcclusion:(double)a3;
- (void)setShaderModifiers:(id)a3;
- (void)setShininess:(CGFloat)shininess;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setTransparency:(CGFloat)transparency;
- (void)setTransparencyMode:(SCNTransparencyMode)transparencyMode;
- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNMaterial

- (void)_setupMaterialProperty:(id *)a3
{
  if (a3)
  {
    v5 = [(SCNMaterial *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    v7 = [(SCNMaterial *)self commonProfile];
    if (!v7)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SCNMaterial _setupMaterialProperty:](v11);
      }
      goto LABEL_46;
    }
    if (&self->_diffuse == (SCNMaterialProperty **)a3) {
      char v8 = 2;
    }
    else {
      char v8 = 21;
    }
    if (&self->_ambient == (SCNMaterialProperty **)a3) {
      char v8 = 1;
    }
    if (&self->_specular == (SCNMaterialProperty **)a3) {
      char v8 = 3;
    }
    if (&self->_emission == (SCNMaterialProperty **)a3) {
      char v8 = 0;
    }
    if (&self->_reflective == (SCNMaterialProperty **)a3) {
      char v8 = 4;
    }
    if (&self->_transparent == (SCNMaterialProperty **)a3) {
      char v8 = 5;
    }
    if (&self->_multiply == (SCNMaterialProperty **)a3) {
      char v8 = 6;
    }
    if (&self->_normal == (SCNMaterialProperty **)a3) {
      char v8 = 7;
    }
    if (&self->_selfIllumination == (SCNMaterialProperty **)a3) {
      char v8 = 9;
    }
    if (&self->_ambientOcclusion == (SCNMaterialProperty **)a3) {
      char v8 = 8;
    }
    if (&self->_metalness == (SCNMaterialProperty **)a3) {
      char v8 = 10;
    }
    if (&self->_roughness == (SCNMaterialProperty **)a3) {
      char v8 = 11;
    }
    if (&self->_displacement == (SCNMaterialProperty **)a3) {
      char v8 = 15;
    }
    if (&self->_clearCoat == (SCNMaterialProperty **)a3) {
      char v8 = 12;
    }
    if (&self->_clearCoatRoughness == (SCNMaterialProperty **)a3) {
      char v8 = 13;
    }
    if (&self->_clearCoatNormal == (SCNMaterialProperty **)a3) {
      char v8 = 14;
    }
    uint64_t v9 = v8;
    if (v8 == 21)
    {
      uint64_t Image = 0;
    }
    else
    {
      uint64_t v12 = (uint64_t)v7;
      Color = (uint64_t *)C3DEffectCommonProfileGetColor((uint64_t)v7, v8);
      uint64_t Image = C3DEffectCommonProfileGetImage(v12, v9);
      if (Color) {
        goto LABEL_44;
      }
    }
    Color = &v15;
    C3DColor4Make((float *)&v15, 0.5, 0.5, 0.5, 1.0);
LABEL_44:
    v14 = objc_msgSend(objc_alloc(-[SCNMaterial _materialPropertyClass](self, "_materialPropertyClass")), "initWithParent:propertyType:", self, v9);
    *a3 = v14;
    objc_msgSend(v14, "_setColor:", objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", Color));
    [*a3 _setC3DImageRef:Image];
    if ((C3DWasLinkedBeforeMajorOSYear2017() & 1) == 0) {
      [*a3 _setupContentsFromC3DImage];
    }
LABEL_46:
    if (v6) {
      C3DSceneUnlock(v6);
    }
  }
}

- (__C3DEffectCommonProfile)commonProfile
{
  v2 = [(SCNMaterial *)self materialRef];

  return (__C3DEffectCommonProfile *)C3DMaterialGetCommonProfile((uint64_t)v2);
}

- (__C3DMaterial)materialRef
{
  return self->_material;
}

- (Class)_materialPropertyClass
{
  return (Class)objc_opt_class();
}

- (__C3DScene)sceneRef
{
  v2 = [(SCNMaterial *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (void)__CFObject
{
  return self->_material;
}

void __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke_2(uint64_t a1)
{
  v2 = *(__int16 **)(a1 + 48);
  if (v2)
  {
    C3DEntitySetValueForKey(*(void *)(a1 + 56), *(void **)(a1 + 32), v2);
    v3 = *(const void **)(a1 + 48);
    CFRelease(v3);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(__int16 **)(a1 + 40);
    if (v6)
    {
      C3DEntitySetValueForKey(v4, v5, v6);
    }
    else
    {
      C3DEntityResetValueForKey(v4, v5);
    }
  }
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return SCNObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (void)_syncObjCModel
{
  v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  v5 = [(SCNMaterial *)self materialRef];
  self->_cullMode = (int)C3DMaterialGetCullMode((uint64_t)v5);
  self->_writesToDepthBuffer = C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)v5);
  self->_readsFromDepthBuffer = C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)v5);
  self->_colorBufferWriteMask = C3DMaterialGetColorBufferWriteMask((uint64_t)v5);
  self->_doubleSided = C3DMaterialIsDoubleSided((uint64_t)v5);
  self->_fillMode = (int)C3DMaterialGetFillMode((uint64_t)v5);
  self->_blendMode = (int)C3DMaterialGetBlendMode((uint64_t)v5);
  CommonProfile = (float *)C3DMaterialGetCommonProfile((uint64_t)v5);
  if (CommonProfile)
  {
    v7 = CommonProfile;
    self->_shininess = C3DEffectCommonProfileGetFloatProperty(CommonProfile, 16);
    self->_transparency = C3DEffectCommonProfileGetFloatProperty(v7, 18);
    self->_indexOfRefraction = C3DEffectCommonProfileGetFloatProperty(v7, 19);
    self->_fresnelExponent = C3DEffectCommonProfileGetFloatProperty(v7, 20);
    self->_transparencyMode = C3DEffectCommonProfileGetTransparencyMode((uint64_t)v7);
    unsigned int LightingModel = C3DEffectCommonProfileGetLightingModel((uint64_t)v7);
    if (LightingModel > 6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = off_2640085A0[LightingModel];
    }
    self->_lightingModelName = (NSString *)v9;
    self->_litPerPixel = C3DEffectCommonProfileIsPerPixelLit((uint64_t)v7);
    self->_locksAmbientWithDiffuse = C3DEffectCommonProfileGetEnableLockAmbientWithDiffuse((uint64_t)v7);
    self->_avoidsOverLighting = C3DEffectCommonProfileGetAvoidsOverLighting((uint64_t)v7);
    self->_selfIlluminationOcclusion = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)v7);
  }
  uint64_t Technique = C3DMaterialGetTechnique((uint64_t)v5);
  if (Technique)
  {
    uint64_t v11 = Technique;
    if (C3DFXTechniqueGetPassCount(Technique) >= 1)
    {
      uint64_t PassAtIndex = C3DFXTechniqueGetPassAtIndex(v11, 0);
      uint64_t Program = C3DFXPassGetProgram(PassAtIndex);
      if (Program)
      {
        v14 = (void *)Program;
        uint64_t v15 = objc_alloc_init(SCNProgram);
        uint64_t ShaderSources = C3DFXGLSLProgramGetShaderSources(v14);
        uint64_t v18 = v17;
        [(SCNProgram *)v15 setVertexShader:ShaderSources];
        [(SCNProgram *)v15 setFragmentShader:v18];
        [(SCNProgram *)v15 setName:C3DEntityGetName((uint64_t)v14)];
        [(SCNMaterial *)self setProgram:v15];
      }
    }
  }
  [(SCNMaterial *)self _syncEntityObjCModel];
  if (v4)
  {
    C3DSceneUnlock(v4);
  }
}

- (void)_syncEntityObjCModel
{
  v3 = [(SCNMaterial *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

+ (SCNMaterial)materialWithMDLMaterial:(id)a3 options:(id)a4
{
  if (!a3) {
    return 0;
  }
  AssociatedObject = (SCNMaterial *)objc_getAssociatedObject(a3, @"SCNSceneKitAssociatedObject");
  [a3 scatteringFunction];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v9 = AssociatedObject;
  if (!AssociatedObject)
  {
    uint64_t v9 = (SCNMaterial *)[a1 material];
    -[SCNMaterial setName:](v9, "setName:", [a3 name]);
    objc_setAssociatedObject(a3, @"SCNSceneKitAssociatedObject", v9, (void *)0x301);
    objc_setAssociatedObject(v9, @"SCNSceneKitAssociatedObject", a3, 0);
  }
  v10 = &SCNLightingModelPhysicallyBased;
  if ((isKindOfClass & 1) == 0) {
    v10 = &SCNLightingModelBlinn;
  }
  [(SCNMaterial *)v9 setLightingModelName:*v10];
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 emission], (MDLMaterial *)a3, MDLMaterialSemanticEmission, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 diffuse], (MDLMaterial *)a3, MDLMaterialSemanticBaseColor, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 specular], (MDLMaterial *)a3, MDLMaterialSemanticSpecular, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 reflective], (MDLMaterial *)a3, MDLMaterialSemanticUserDefined, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 transparent], (MDLMaterial *)a3, MDLMaterialSemanticOpacity, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 displacement], (MDLMaterial *)a3, MDLMaterialSemanticDisplacement, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 normal], (MDLMaterial *)a3, MDLMaterialSemanticTangentSpaceNormal, AssociatedObject == 0, (NSDictionary *)a4);
  setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 ambientOcclusion], (MDLMaterial *)a3, MDLMaterialSemanticAmbientOcclusion, AssociatedObject == 0, (NSDictionary *)a4);
  if ([a3 materialFace] == 2) {
    [(SCNMaterial *)v9 setDoubleSided:1];
  }
  if (isKindOfClass)
  {
    BOOL v11 = AssociatedObject == 0;
    setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 metalness], (MDLMaterial *)a3, MDLMaterialSemanticMetallic, v11, (NSDictionary *)a4);
    setupSCNMaterialProperty((MDLTextureSampler *)[(SCNMaterial *)v9 roughness], (MDLMaterial *)a3, MDLMaterialSemanticRoughness, v11, (NSDictionary *)a4);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(a3, "propertyWithSemantic:", 6), "floatValue");
    [(SCNMaterial *)v9 setShininess:(float)((float)(2.0 / (float)(v12 * v12)) + -2.0)];
  }
  return v9;
}

- (id)_property:(id *)a3
{
  if (!*a3) {
    [(SCNMaterial *)self _setupMaterialProperty:a3];
  }
  id result = *a3;
  if (self->_isPresentationInstance)
  {
    return (id)[result presentationMaterialProperty];
  }
  return result;
}

- (SCNMaterialProperty)roughness
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_roughness];
}

- (SCNMaterialProperty)normal
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_normal];
}

- (SCNMaterialProperty)diffuse
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_diffuse];
}

- (SCNMaterialProperty)emission
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_emission];
}

- (SCNMaterialProperty)ambientOcclusion
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_ambientOcclusion];
}

- (SCNMaterialProperty)transparent
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_transparent];
}

- (SCNMaterialProperty)metalness
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_metalness];
}

- (SCNMaterialProperty)specular
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_specular];
}

- (void)setName:(NSString *)name
{
  if (self->_isPresentationInstance)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial setName:]();
    }
  }
  else if ((unint64_t)name | (unint64_t)self->_name && (-[NSString isEqual:](name, "isEqual:") & 1) == 0)
  {

    self->_name = (NSString *)[(NSString *)name copy];
    uint64_t v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __23__SCNMaterial_setName___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = name;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

CFStringRef __23__SCNMaterial_setName___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  return C3DEntitySetName(v2, v3);
}

- (void)setLightingModelName:(SCNLightingModel)lightingModelName
{
  if (![(NSString *)lightingModelName isEqualToString:self->_lightingModelName])
  {

    self->_lightingModelName = (NSString *)[(NSString *)lightingModelName copy];
    v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNMaterial_setLightingModelName___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = lightingModelName;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

void __36__SCNMaterial_setLightingModelName___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  CFStringRef v3 = *(void **)(a1 + 40);
  if (!v3) {
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"SCNLightingModelPhysicallyBased"])
  {
    int v4 = 5;
    goto LABEL_6;
  }
  if ([v3 isEqualToString:@"SCNLightingModelBlinn"]) {
    goto LABEL_5;
  }
  if ([v3 isEqualToString:@"SCNLightingModelPhong"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SCNLightingModelLambert"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SCNLightingModelConstant"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SCNLightingModelNone"])
  {
    int v4 = 4;
  }
  else
  {
    if (([v3 isEqualToString:@"SCNLightingModelShadowOnly"] & 1) == 0)
    {
LABEL_5:
      int v4 = 3;
      goto LABEL_6;
    }
    int v4 = 6;
  }
LABEL_6:

  C3DEffectCommonProfileSetLightingModel(CommonProfile, v4);
}

- (SCNMaterialProperty)reflective
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_reflective];
}

- (SCNMaterialProperty)displacement
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_displacement];
}

+ (SCNMaterial)material
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNMaterial *)v2;
}

- (SCNMaterial)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNMaterial;
  id v2 = [(SCNMaterial *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DMaterialCreate();
    v2->_material = (__C3DMaterial *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    [(SCNMaterial *)v2 _syncObjCModel];
  }
  return v2;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v5 = objc_msgSend(a3, "animationKeys", 0);
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
        BOOL v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNMaterial *)self addAnimationPlayer:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  Copy = (const void *)C3DMaterialCreateCopy((uint64_t)self->_material);
  objc_super v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMaterialRef:Copy];
  CFRelease(Copy);
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  objc_msgSend(v5, "setName:", -[SCNMaterial name](self, "name"));
  objc_msgSend(v5, "setIdentifier:", -[SCNMaterial identifier](self, "identifier"));
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_valuesForUndefinedKeys copy];
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __28__SCNMaterial_copyWithZone___block_invoke;
  v8[3] = &unk_264006110;
  v8[4] = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  [(SCNMaterial *)self shininess];
  objc_msgSend(v5, "setShininess:");
  [(SCNMaterial *)self transparency];
  objc_msgSend(v5, "setTransparency:");
  objc_msgSend(v5, "setTransparencyMode:", -[SCNMaterial transparencyMode](self, "transparencyMode"));
  objc_msgSend(v5, "setLightingModelName:", -[SCNMaterial lightingModelName](self, "lightingModelName"));
  objc_msgSend(v5, "setLitPerPixel:", -[SCNMaterial isLitPerPixel](self, "isLitPerPixel"));
  objc_msgSend(v5, "setDoubleSided:", -[SCNMaterial isDoubleSided](self, "isDoubleSided"));
  objc_msgSend(v5, "setCullMode:", -[SCNMaterial cullMode](self, "cullMode"));
  objc_msgSend(v5, "setProgram:", -[SCNMaterial program](self, "program"));
  objc_msgSend(v5, "setLocksAmbientWithDiffuse:", -[SCNMaterial locksAmbientWithDiffuse](self, "locksAmbientWithDiffuse"));
  objc_msgSend(v5, "setAvoidsOverLighting:", -[SCNMaterial avoidsOverLighting](self, "avoidsOverLighting"));
  objc_msgSend(v5, "setFillMode:", -[SCNMaterial fillMode](self, "fillMode"));
  [(SCNMaterial *)self fresnelExponent];
  objc_msgSend(v5, "setFresnelExponent:");
  objc_msgSend(v5, "setWritesToDepthBuffer:", -[SCNMaterial writesToDepthBuffer](self, "writesToDepthBuffer"));
  objc_msgSend(v5, "setReadsFromDepthBuffer:", -[SCNMaterial readsFromDepthBuffer](self, "readsFromDepthBuffer"));
  objc_msgSend(v5, "setColorBufferWriteMask:", -[SCNMaterial colorBufferWriteMask](self, "colorBufferWriteMask"));
  objc_msgSend(v5, "setBlendMode:", -[SCNMaterial blendMode](self, "blendMode"));
  if (self->_ambient) {
    objc_msgSend((id)objc_msgSend(v5, "ambient"), "copyPropertiesFrom:", self->_ambient);
  }
  if (self->_diffuse) {
    objc_msgSend((id)objc_msgSend(v5, "diffuse"), "copyPropertiesFrom:", self->_diffuse);
  }
  if (self->_specular) {
    objc_msgSend((id)objc_msgSend(v5, "specular"), "copyPropertiesFrom:", self->_specular);
  }
  if (self->_emission) {
    objc_msgSend((id)objc_msgSend(v5, "emission"), "copyPropertiesFrom:", self->_emission);
  }
  if (self->_transparent) {
    objc_msgSend((id)objc_msgSend(v5, "transparent"), "copyPropertiesFrom:", self->_transparent);
  }
  if (self->_multiply) {
    objc_msgSend((id)objc_msgSend(v5, "multiply"), "copyPropertiesFrom:", self->_multiply);
  }
  if (self->_reflective) {
    objc_msgSend((id)objc_msgSend(v5, "reflective"), "copyPropertiesFrom:", self->_reflective);
  }
  if (self->_normal) {
    objc_msgSend((id)objc_msgSend(v5, "normal"), "copyPropertiesFrom:", self->_normal);
  }
  if (self->_selfIllumination) {
    objc_msgSend((id)objc_msgSend(v5, "selfIllumination"), "copyPropertiesFrom:", self->_selfIllumination);
  }
  if (self->_ambientOcclusion) {
    objc_msgSend((id)objc_msgSend(v5, "ambientOcclusion"), "copyPropertiesFrom:", self->_ambientOcclusion);
  }
  if (self->_metalness) {
    objc_msgSend((id)objc_msgSend(v5, "metalness"), "copyPropertiesFrom:", self->_metalness);
  }
  if (self->_roughness) {
    objc_msgSend((id)objc_msgSend(v5, "roughness"), "copyPropertiesFrom:", self->_roughness);
  }
  if (self->_displacement) {
    objc_msgSend((id)objc_msgSend(v5, "displacement"), "copyPropertiesFrom:", self->_displacement);
  }
  if (self->_clearCoat) {
    objc_msgSend((id)objc_msgSend(v5, "clearCoat"), "copyPropertiesFrom:", self->_clearCoat);
  }
  if (self->_clearCoatRoughness) {
    objc_msgSend((id)objc_msgSend(v5, "clearCoatRoughness"), "copyPropertiesFrom:", self->_clearCoatRoughness);
  }
  if (self->_clearCoatNormal) {
    objc_msgSend((id)objc_msgSend(v5, "clearCoatNormal"), "copyPropertiesFrom:", self->_clearCoatNormal);
  }
  [v5 _copyAnimationsFrom:self];
  [v5 copyShaderModifiersAndLanguageVersionFrom:self];
  +[SCNTransaction commitImmediate];
  return v5;
}

- (BOOL)writesToDepthBuffer
{
  if (!self->_isPresentationInstance) {
    return self->_writesToDepthBuffer;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    BOOL v5 = C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)self->_material);
    C3DSceneUnlock(v4);
    return v5;
  }
  else
  {
    material = self->_material;
    return C3DMaterialGetEnableWriteInDepthBuffer((uint64_t)material);
  }
}

- (CGFloat)transparency
{
  if (!self->_isPresentationInstance) {
    return self->_transparency;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  BOOL v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    double FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 18);
    if (!v4) {
      return FloatProperty;
    }
    goto LABEL_9;
  }
  double FloatProperty = 0.0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (SCNTransparencyMode)transparencyMode
{
  if (!self->_isPresentationInstance) {
    return self->_transparencyMode;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  BOOL v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    SCNTransparencyMode TransparencyMode = (unint64_t)C3DEffectCommonProfileGetTransparencyMode((uint64_t)v5);
    if (!v4) {
      return TransparencyMode;
    }
    goto LABEL_9;
  }
  SCNTransparencyMode TransparencyMode = SCNTransparencyModeAOne;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return TransparencyMode;
}

- (CGFloat)shininess
{
  if (!self->_isPresentationInstance) {
    return self->_shininess;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  BOOL v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    double FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 16);
    if (!v4) {
      return FloatProperty;
    }
    goto LABEL_9;
  }
  double FloatProperty = 0.0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (void)setWritesToDepthBuffer:(BOOL)writesToDepthBuffer
{
  if (self->_writesToDepthBuffer != writesToDepthBuffer)
  {
    self->_writesToDepthBuffer = writesToDepthBuffer;
    BOOL v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__SCNMaterial_setWritesToDepthBuffer___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = writesToDepthBuffer;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setTransparencyMode:(SCNTransparencyMode)transparencyMode
{
  if (self->_transparencyMode != transparencyMode)
  {
    self->_transparencyMode = transparencyMode;
    BOOL v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterial_setTransparencyMode___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = transparencyMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setTransparency:(CGFloat)transparency
{
  if (self->_transparency != transparency)
  {
    float v5 = transparency;
    self->_transparency = v5;
    uint64_t v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNMaterial_setTransparency___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = transparency;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"transparency" applyBlock:v7];
  }
}

- (void)setShininess:(CGFloat)shininess
{
  if (self->_shininess != shininess)
  {
    float v5 = shininess;
    self->_shininess = v5;
    uint64_t v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __28__SCNMaterial_setShininess___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = shininess;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"shininess" applyBlock:v7];
  }
}

- (void)setReadsFromDepthBuffer:(BOOL)readsFromDepthBuffer
{
  if (self->_readsFromDepthBuffer != readsFromDepthBuffer)
  {
    self->_readsFromDepthBuffer = readsFromDepthBuffer;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__SCNMaterial_setReadsFromDepthBuffer___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = readsFromDepthBuffer;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setProgram:(id)a3
{
  if (self->_isPresentationInstance)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial setProgram:]();
    }
  }
  else
  {
    if (a3)
    {
      [(SCNMaterial *)self _setupShadableHelperIfNeeded];
      shadableHelper = self->_shadableHelper;
      id v7 = a3;
    }
    else
    {
      shadableHelper = self->_shadableHelper;
      id v7 = 0;
    }
    [(SCNShadableHelper *)shadableHelper setProgram:v7];
  }
}

- (void)setLocksAmbientWithDiffuse:(BOOL)locksAmbientWithDiffuse
{
  if (self->_locksAmbientWithDiffuse != locksAmbientWithDiffuse)
  {
    self->_locksAmbientWithDiffuse = locksAmbientWithDiffuse;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__SCNMaterial_setLocksAmbientWithDiffuse___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = locksAmbientWithDiffuse;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"lockAmbientWithDiffuse" applyBlock:v6];
  }
}

- (void)setLitPerPixel:(BOOL)litPerPixel
{
  if (self->_litPerPixel != litPerPixel)
  {
    self->_litPerPixel = litPerPixel;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__SCNMaterial_setLitPerPixel___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = litPerPixel;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"litPerPixel" applyBlock:v6];
  }
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = [(SCNMaterial *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (void)setFresnelExponent:(CGFloat)fresnelExponent
{
  if (self->_fresnelExponent != fresnelExponent)
  {
    float v5 = fresnelExponent;
    self->_fresnelExponent = v5;
    uint64_t v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__SCNMaterial_setFresnelExponent___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(CGFloat *)&v7[5] = fresnelExponent;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"fresnelExponent" applyBlock:v7];
  }
}

- (void)setFillMode:(SCNFillMode)fillMode
{
  if (self->_fillMode != fillMode)
  {
    self->_fillMode = fillMode;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__SCNMaterial_setFillMode___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = fillMode;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"fillMode" applyBlock:v6];
  }
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  if (self->_doubleSided != doubleSided)
  {
    self->_doubleSided = doubleSided;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __30__SCNMaterial_setDoubleSided___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = doubleSided;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"doubleSided" applyBlock:v6];
  }
}

- (void)setCullMode:(SCNCullMode)cullMode
{
  if (self->_cullMode != cullMode)
  {
    self->_cullMode = cullMode;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __27__SCNMaterial_setCullMode___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = cullMode;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"cullMode" applyBlock:v6];
  }
}

- (void)setColorBufferWriteMask:(SCNColorMask)colorBufferWriteMask
{
  if (self->_colorBufferWriteMask != colorBufferWriteMask)
  {
    self->_colorBufferWriteMask = colorBufferWriteMask;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __39__SCNMaterial_setColorBufferWriteMask___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = colorBufferWriteMask;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setBlendMode:(SCNBlendMode)blendMode
{
  if (self->_blendMode != blendMode)
  {
    self->_blendMode = blendMode;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __28__SCNMaterial_setBlendMode___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    void v6[5] = blendMode;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setAvoidsOverLighting:(BOOL)a3
{
  if (self->_avoidsOverLighting != a3)
  {
    self->_avoidsOverLighting = a3;
    float v5 = [(SCNMaterial *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__SCNMaterial_setAvoidsOverLighting___block_invoke;
    v6[3] = &unk_264004FE8;
    v6[4] = self;
    BOOL v7 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (BOOL)readsFromDepthBuffer
{
  if (!self->_isPresentationInstance) {
    return self->_readsFromDepthBuffer;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    BOOL EnableReadsFromDepthBuffer = C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)self->_material);
    C3DSceneUnlock(v4);
    return EnableReadsFromDepthBuffer;
  }
  else
  {
    material = self->_material;
    return C3DMaterialGetEnableReadsFromDepthBuffer((uint64_t)material);
  }
}

- (SCNProgram)program
{
  return [(SCNShadableHelper *)self->_shadableHelper program];
}

- (NSString)name
{
  if (!self->_isPresentationInstance) {
    return self->_name;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  Name = (NSString *)C3DEntityGetName((uint64_t)[(SCNMaterial *)self __CFObject]);
  if (v4) {
    C3DSceneUnlock(v4);
  }
  return Name;
}

- (BOOL)locksAmbientWithDiffuse
{
  if (!self->_isPresentationInstance) {
    return self->_locksAmbientWithDiffuse;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  float v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    char EnableLockAmbientWithDiffuse = C3DEffectCommonProfileGetEnableLockAmbientWithDiffuse((uint64_t)v5);
    if (!v4) {
      return EnableLockAmbientWithDiffuse;
    }
    goto LABEL_9;
  }
  char EnableLockAmbientWithDiffuse = 0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return EnableLockAmbientWithDiffuse;
}

- (SCNLightingModel)lightingModelName
{
  if (!self->_isPresentationInstance) {
    return self->_lightingModelName;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  unsigned int LightingModel = C3DEffectCommonProfileGetLightingModel((uint64_t)[(SCNMaterial *)self commonProfile]);
  if (LightingModel <= 6)
  {
    uint64_t v6 = off_2640085A0[LightingModel];
    if (!v4) {
      return &v6->isa;
    }
    goto LABEL_9;
  }
  uint64_t v6 = 0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return &v6->isa;
}

- (BOOL)isLitPerPixel
{
  if (!self->_isPresentationInstance) {
    return self->_litPerPixel;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  float v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    char IsPerPixelLit = C3DEffectCommonProfileIsPerPixelLit((uint64_t)v5);
    if (!v4) {
      return IsPerPixelLit;
    }
    goto LABEL_9;
  }
  char IsPerPixelLit = 0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return IsPerPixelLit;
}

- (BOOL)isDoubleSided
{
  if (!self->_isPresentationInstance) {
    return self->_doubleSided;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    C3DSceneLock((uint64_t)v3);
    char IsDoubleSided = C3DMaterialIsDoubleSided((uint64_t)self->_material);
    C3DSceneUnlock(v4);
    return IsDoubleSided;
  }
  else
  {
    material = self->_material;
    return C3DMaterialIsDoubleSided((uint64_t)material);
  }
}

- (SCNMaterial)initWithMaterialRef:(__C3DMaterial *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNMaterial;
  uint64_t v4 = [(SCNMaterial *)&v7 init];
  if (v4)
  {
    float v5 = (__C3DMaterial *)CFRetain(a3);
    v4->_material = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    [(SCNMaterial *)v4 _syncObjCModel];
    [(SCNMaterial *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (id)identifier
{
  id v2 = [(SCNMaterial *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (CGFloat)fresnelExponent
{
  if (!self->_isPresentationInstance) {
    return self->_fresnelExponent;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  float v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    double FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 20);
    if (!v4) {
      return FloatProperty;
    }
    goto LABEL_9;
  }
  double FloatProperty = 0.0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return FloatProperty;
}

- (SCNFillMode)fillMode
{
  if (!self->_isPresentationInstance) {
    return self->_fillMode;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (!v3) {
    return (uint64_t)(int)C3DMaterialGetFillMode((uint64_t)self->_material);
  }
  uint64_t v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  SCNFillMode FillMode = (int)C3DMaterialGetFillMode((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return FillMode;
}

- (SCNCullMode)cullMode
{
  if (!self->_isPresentationInstance) {
    return self->_cullMode;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (!v3) {
    return (uint64_t)(int)C3DMaterialGetCullMode((uint64_t)self->_material);
  }
  uint64_t v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  SCNCullMode CullMode = (int)C3DMaterialGetCullMode((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return CullMode;
}

- (SCNColorMask)colorBufferWriteMask
{
  if (!self->_isPresentationInstance) {
    return self->_colorBufferWriteMask;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  if (!v3) {
    return C3DMaterialGetColorBufferWriteMask((uint64_t)self->_material);
  }
  uint64_t v4 = (uint64_t)v3;
  C3DSceneLock((uint64_t)v3);
  SCNColorMask v5 = C3DMaterialGetColorBufferWriteMask((uint64_t)self->_material);
  C3DSceneUnlock(v4);
  return v5;
}

- (SCNBlendMode)blendMode
{
  if (self->_isPresentationInstance)
  {
    uint64_t v3 = [(SCNMaterial *)self sceneRef];
    uint64_t v4 = (uint64_t)v3;
    if (v3) {
      C3DSceneLock((uint64_t)v3);
    }
    double BlendMode = (double)(int)C3DMaterialGetBlendMode((uint64_t)[(SCNMaterial *)self materialRef]);
    if (v4) {
      C3DSceneUnlock(v4);
    }
  }
  else
  {
    return (uint64_t)(double)self->_blendMode;
  }
  return (uint64_t)BlendMode;
}

- (BOOL)avoidsOverLighting
{
  if (!self->_isPresentationInstance) {
    return self->_avoidsOverLighting;
  }
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  SCNColorMask v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    char AvoidsOverLighting = C3DEffectCommonProfileGetAvoidsOverLighting((uint64_t)v5);
    if (!v4) {
      return AvoidsOverLighting;
    }
    goto LABEL_9;
  }
  char AvoidsOverLighting = 0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return AvoidsOverLighting;
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
  uint64_t v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  SCNColorMask v5 = [(SCNMaterial *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      objc_super v7 = scn_default_log();
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

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  if (self->_isPresentationInstance)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial copyShaderModifiersAndLanguageVersionFrom:]();
    }
  }
  else
  {
    if ([a3 shaderModifiers]) {
      [(SCNMaterial *)self _setupShadableHelperIfNeeded];
    }
    uint64_t v6 = objc_msgSend(a3, "__shadableHelper");
    [(SCNShadableHelper *)self->_shadableHelper copyModifiersFrom:v6];
    uint64_t v7 = [v6 minimumLanguageVersion];
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setMinimumLanguageVersion:v7];
  }
}

- (NSDictionary)shaderModifiers
{
  return [(SCNShadableHelper *)self->_shadableHelper shaderModifiers];
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

- (id)copy
{
  return [(SCNMaterial *)self copyWithZone:0];
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  if (!self->_isPresentationInstance)
  {
    id v6 = a4;
    if ([a4 hasPrefix:@"shaderModifiers."]) {
      id v6 = (id)[v6 substringFromIndex:16];
    }
    os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    id v8 = (id)[(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:v6];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      [(SCNMaterial *)self willChangeValueForKey:@"customMaterialProperties"];
      [(SCNMaterial *)self willChangeValueForKey:@"customMaterialAttributes"];
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
    }
    valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
    if (a3)
    {
      if (!valuesForUndefinedKeys)
      {
        valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
      }
      [(NSMutableDictionary *)valuesForUndefinedKeys setObject:a3 forKey:v6];
    }
    else
    {
      [(NSMutableDictionary *)valuesForUndefinedKeys removeObjectForKey:v6];
    }
    os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
    if ((isKindOfClass & 1) == 0)
    {
      [(SCNMaterial *)self didChangeValueForKey:@"customMaterialProperties"];
      [(SCNMaterial *)self didChangeValueForKey:@"customMaterialAttributes"];
    }
    BOOL v11 = [(SCNMaterial *)self __CFObject];
    objc_opt_class();
    id v12 = v6;
    if (objc_opt_isKindOfClass())
    {
      [v8 unlinkCustomPropertyWithParent:self];
      id v12 = 0;
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 linkCustomPropertyWithParent:self andCustomName:v6];
      long long v13 = (const void *)[a3 effectSlot];
      if (v13) {
        uint64_t v14 = (uint64_t)CFRetain(v13);
      }
      else {
        uint64_t v14 = 0;
      }
      id v12 = 0;
      goto LABEL_30;
    }
    uint64_t v14 = SCNCopyValueFromObjCProperty(self, v6);
    if (!v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v14 = (uint64_t)SCNCopyValueFromObjCValue(a3);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = 0;
LABEL_30:
          v19 = [(SCNMaterial *)self sceneRef];
          v20[0] = MEMORY[0x263EF8330];
          v20[1] = 3221225472;
          v20[2] = __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke_2;
          v20[3] = &unk_264008580;
          v20[6] = v14;
          v20[7] = v11;
          v20[4] = v6;
          v20[5] = a3;
          +[SCNTransaction postCommandWithContext:v19 object:self keyPath:v12 applyBlock:v20];
          return;
        }
        v22[0] = C3DColor4FromRGBCFColor(a3, 0);
        v22[1] = v15;
        uint64_t v14 = C3DValueCreate(10, 1);
        C3DValueInitFrom(v14, v22);
      }
    }
    if (v14 && !v8)
    {
      int Type = C3DValueGetType(v14);
      uint64_t Default = C3DValueCreateDefault(Type);
      uint64_t v18 = [(SCNMaterial *)self sceneRef];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke;
      v21[3] = &unk_264007A28;
      v21[4] = v6;
      v21[5] = v11;
      v21[6] = Default;
      +[SCNTransaction postCommandWithContext:v18 object:self applyBlock:v21];
    }
    goto LABEL_30;
  }
  SCNColorMask v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SCNMaterial _shadableSetValue:forUndefinedKey:]();
  }
}

void __49__SCNMaterial__shadableSetValue_forUndefinedKey___block_invoke(uint64_t a1)
{
  C3DEntitySetValueForKey(*(void *)(a1 + 40), *(void **)(a1 + 32), *(__int16 **)(a1 + 48));
  id v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)setShaderModifiers:(id)a3
{
  if (self->_isPresentationInstance)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial setShaderModifiers:]();
    }
  }
  else
  {
    if (a3) {
      [(SCNMaterial *)self _setupShadableHelperIfNeeded];
    }
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setShaderModifiers:a3];
  }
}

- (void)_setupShadableHelperIfNeeded
{
  if (!self->_shadableHelper) {
    self->_shadableHelper = [[SCNShadableHelper alloc] initWithOwner:self];
  }
}

- (id)_integrateModelKitComputedMaps:(id)a3 withGeometry:(id)a4 node:(id)a5 texturePathProvider:(id)a6 vertexAttributeNamed:(id)a7 materialPropertyNamed:(id)a8 filePath:(id)a9
{
  int v16 = [a7 isEqualToString:*MEMORY[0x263F13578]];
  uint64_t v17 = (void *)[a3 propertyNamed:a8];
  if (!v17) {
    return 0;
  }
  uint64_t v18 = v17;
  if (![v17 textureSamplerValue]
    || !objc_msgSend((id)objc_msgSend(v18, "textureSamplerValue"), "texture"))
  {
    return 0;
  }
  if (a6) {
    uint64_t v19 = (*((uint64_t (**)(id, id))a6 + 2))(a6, a5);
  }
  else {
    uint64_t v19 = [NSString stringWithFormat:@"/tmp/ModelKit_AO_%@.png", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString")];
  }
  id v21 = (id)v19;
  if ([a9 isEqualToString:&stru_26BF72F58])
  {
    v22 = objc_msgSend((id)objc_msgSend(v18, "textureSamplerValue"), "texture");
    objc_msgSend(v22, "writeToURL:", objc_msgSend(NSURL, "fileURLWithPath:", v21));
    [a9 setString:v21];
  }
  else
  {
    id v21 = a9;
  }
  v23 = (void *)[a4 geometrySourcesForSemantic:@"kGeometrySourceSemanticTexcoord"];
  int v24 = [v23 count];
  int v25 = v24;
  if (v24 < 1)
  {
    LODWORD(v26) = 0;
  }
  else
  {
    uint64_t v26 = 0;
    uint64_t v27 = v24;
    while ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", v26), "mkSemantic"), "isEqualToString:", a7) & 1) == 0)
    {
      if (v27 == ++v26)
      {
        LODWORD(v26) = v25;
        break;
      }
    }
  }
  if (v16)
  {
    [(SCNMaterialProperty *)[(SCNMaterial *)self ambientOcclusion] setMappingChannel:v26];
    v28 = [(SCNMaterial *)self ambientOcclusion];
  }
  else
  {
    [(SCNMaterialProperty *)[(SCNMaterial *)self selfIllumination] setMappingChannel:v26];
    v28 = [(SCNMaterial *)self selfIllumination];
  }
  [(SCNMaterialProperty *)v28 setContents:v21];
  v29 = NSURL;

  return (id)[v29 fileURLWithPath:v21];
}

+ (SCNMaterial)materialWithMDLMaterial:(MDLMaterial *)mdlMaterial
{
  return (SCNMaterial *)[a1 materialWithMDLMaterial:mdlMaterial options:0];
}

- (id)initPresentationMaterialWithMaterialRef:(__C3DMaterial *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNMaterial;
  uint64_t v4 = [(SCNMaterial *)&v7 init];
  SCNColorMask v5 = v4;
  if (v4)
  {
    v4->_isPresentationInstance = 1;
    v4->_material = (__C3DMaterial *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNMaterial)materialWithMaterialRef:(__C3DMaterial *)a3
{
  id result = (SCNMaterial *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    id v6 = (void *)[objc_alloc((Class)a1) initWithMaterialRef:a3];
    return (SCNMaterial *)v6;
  }
  return result;
}

+ (SCNMaterial)materialWithColor:(id)a3
{
  uint64_t v4 = (SCNMaterial *)objc_alloc_init((Class)a1);
  [(SCNMaterial *)v4 setColor:a3];
  return v4;
}

+ (SCNMaterial)materialWithContents:(id)a3
{
  uint64_t v4 = (SCNMaterial *)objc_alloc_init((Class)a1);
  [(SCNMaterial *)v4 setContents:a3];
  return v4;
}

- (void)dealloc
{
  [(SCNMaterialProperty *)self->_ambient parentWillDie:self];
  [(SCNMaterialProperty *)self->_diffuse parentWillDie:self];
  [(SCNMaterialProperty *)self->_specular parentWillDie:self];
  [(SCNMaterialProperty *)self->_emission parentWillDie:self];
  [(SCNMaterialProperty *)self->_reflective parentWillDie:self];
  [(SCNMaterialProperty *)self->_transparent parentWillDie:self];
  [(SCNMaterialProperty *)self->_multiply parentWillDie:self];
  [(SCNMaterialProperty *)self->_normal parentWillDie:self];
  [(SCNMaterialProperty *)self->_ambientOcclusion parentWillDie:self];
  [(SCNMaterialProperty *)self->_selfIllumination parentWillDie:self];
  [(SCNMaterialProperty *)self->_metalness parentWillDie:self];
  [(SCNMaterialProperty *)self->_roughness parentWillDie:self];
  [(SCNMaterialProperty *)self->_displacement parentWillDie:self];
  [(SCNMaterialProperty *)self->_clearCoat parentWillDie:self];
  [(SCNMaterialProperty *)self->_clearCoatRoughness parentWillDie:self];
  [(SCNMaterialProperty *)self->_clearCoatNormal parentWillDie:self];
  [(SCNShadableHelper *)self->_shadableHelper ownerWillDie];

  material = self->_material;
  if (material)
  {
    if (!self->_isPresentationInstance)
    {
      C3DEntitySetObjCWrapper((uint64_t)material, 0);
      material = self->_material;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __22__SCNMaterial_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = material;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v5];
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNMaterial;
  [(SCNMaterial *)&v4 dealloc];
}

void __22__SCNMaterial_dealloc__block_invoke(uint64_t a1)
{
}

- (id)presentationMaterial
{
  if (!*((unsigned char *)self + 240))
  {
    id v2 = [[SCNMaterial alloc] initPresentationMaterialWithMaterialRef:*((void *)self + 1)];
    return v2;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)setColor:(id)a3
{
  [(SCNMaterialProperty *)[(SCNMaterial *)self ambient] setColor:a3];
  SCNColorMask v5 = [(SCNMaterial *)self diffuse];

  [(SCNMaterialProperty *)v5 setColor:a3];
}

- (id)color
{
  id v2 = [(SCNMaterial *)self ambient];

  return [(SCNMaterialProperty *)v2 color];
}

- (id)builtinProperties
{
  v4[16] = *MEMORY[0x263EF8340];
  v4[0] = [(SCNMaterial *)self ambient];
  v4[1] = [(SCNMaterial *)self diffuse];
  v4[2] = [(SCNMaterial *)self specular];
  v4[3] = [(SCNMaterial *)self emission];
  v4[4] = [(SCNMaterial *)self transparent];
  v4[5] = [(SCNMaterial *)self reflective];
  v4[6] = [(SCNMaterial *)self multiply];
  v4[7] = [(SCNMaterial *)self normal];
  v4[8] = [(SCNMaterial *)self ambientOcclusion];
  v4[9] = [(SCNMaterial *)self selfIllumination];
  v4[10] = [(SCNMaterial *)self metalness];
  v4[11] = [(SCNMaterial *)self roughness];
  v4[12] = [(SCNMaterial *)self displacement];
  v4[13] = [(SCNMaterial *)self clearCoat];
  v4[14] = [(SCNMaterial *)self clearCoatRoughness];
  v4[15] = [(SCNMaterial *)self clearCoatNormal];
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:16];
}

- (id)properties
{
  id v3 = [(SCNMaterial *)self builtinProperties];
  id v4 = [(SCNMaterial *)self customMaterialProperties];
  if (![v4 count]) {
    return v3;
  }

  return (id)[v3 arrayByAddingObjectsFromArray:v4];
}

- (SCNMaterialProperty)ambient
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_ambient];
}

- (SCNMaterialProperty)multiply
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_multiply];
}

- (SCNMaterialProperty)selfIllumination
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_selfIllumination];
}

- (SCNMaterialProperty)clearCoat
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_clearCoat];
}

- (SCNMaterialProperty)clearCoatRoughness
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_clearCoatRoughness];
}

- (SCNMaterialProperty)clearCoatNormal
{
  return (SCNMaterialProperty *)[(SCNMaterial *)self _property:&self->_clearCoatNormal];
}

void __35__SCNMaterial_setTransparencyMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) commonProfile];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DEffectCommonProfileSetTransparencyMode(v2, v3);
}

void __28__SCNMaterial_setShininess___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  float v3 = *(double *)(a1 + 40);

  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 16, v3);
}

void __31__SCNMaterial_setTransparency___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  float v3 = *(double *)(a1 + 40);

  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 18, v3);
}

- (void)setIndexOfRefraction:(double)a3
{
  if (self->_indexOfRefraction != a3)
  {
    float v5 = a3;
    self->_indexOfRefraction = v5;
    id v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNMaterial_setIndexOfRefraction___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"indexOfRefraction" applyBlock:v7];
  }
}

void __36__SCNMaterial_setIndexOfRefraction___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  float v3 = *(double *)(a1 + 40);

  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 19, v3);
}

- (double)indexOfRefraction
{
  if (!self->_isPresentationInstance) {
    return self->_indexOfRefraction;
  }
  float v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  float v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    double FloatProperty = C3DEffectCommonProfileGetFloatProperty((float *)v5, 19);
    if (!v4) {
      return FloatProperty;
    }
    goto LABEL_9;
  }
  double FloatProperty = 0.0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return FloatProperty;
}

void __34__SCNMaterial_setFresnelExponent___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  float v3 = *(double *)(a1 + 40);

  C3DEffectCommonProfileSetFloatProperty(CommonProfile, 20, v3);
}

- (void)setSelfIlluminationOcclusion:(double)a3
{
  if (self->_selfIlluminationOcclusion != a3)
  {
    float v5 = a3;
    self->_selfIlluminationOcclusion = v5;
    id v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __44__SCNMaterial_setSelfIlluminationOcclusion___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self key:@"selfIlluminationOcclusion" applyBlock:v7];
  }
}

void __44__SCNMaterial_setSelfIlluminationOcclusion___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  float v3 = *(double *)(a1 + 40);

  C3DEffectCommonProfileSetSelfIlluminationOcclusion(CommonProfile, v3);
}

- (double)selfIlluminationOcclusion
{
  if (!self->_isPresentationInstance) {
    return self->_selfIlluminationOcclusion;
  }
  float v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  float v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    double SelfIlluminationOcclusion = C3DEffectCommonProfileGetSelfIlluminationOcclusion((uint64_t)v5);
    if (!v4) {
      return SelfIlluminationOcclusion;
    }
    goto LABEL_9;
  }
  double SelfIlluminationOcclusion = 0.0;
  if (v4) {
LABEL_9:
  }
    C3DSceneUnlock(v4);
  return SelfIlluminationOcclusion;
}

void __28__SCNMaterial_setBlendMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DMaterialSetBlendMode(v2, v3);
}

void __30__SCNMaterial_setLitPerPixel___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DEffectCommonProfileSetPerPixelLit(CommonProfile, v3);
}

void __42__SCNMaterial_setLocksAmbientWithDiffuse___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DEffectCommonProfileSetEnableLockAmbientWithDiffuse(CommonProfile, v3);
}

void __37__SCNMaterial_setAvoidsOverLighting___block_invoke(uint64_t a1)
{
  uint64_t CommonProfile = C3DMaterialGetCommonProfile([*(id *)(a1 + 32) materialRef]);
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DEffectCommonProfileSetAvoidsOverLighting(CommonProfile, v3);
}

void __38__SCNMaterial_setWritesToDepthBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DMaterialSetEnableWriteInDepthBuffer(v2, v3);
}

void __39__SCNMaterial_setColorBufferWriteMask___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DMaterialSetColorBufferWriteMask(v2, v3);
}

void __39__SCNMaterial_setReadsFromDepthBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DMaterialSetEnableReadFromDepthBuffer(v2, v3);
}

- (id)contents
{
  int v3 = [(SCNMaterial *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  if (self->_diffuse)
  {
    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [(SCNMaterial *)self _setupMaterialProperty:&self->_diffuse];
  if (v4) {
LABEL_5:
  }
    C3DSceneUnlock(v4);
LABEL_6:
  diffuse = self->_diffuse;

  return [(SCNMaterialProperty *)diffuse contents];
}

- (void)setContents:(id)a3
{
  [(SCNMaterialProperty *)[(SCNMaterial *)self diffuse] setContents:a3];
  float v5 = [(SCNMaterial *)self ambient];

  [(SCNMaterialProperty *)v5 setContents:a3];
}

void __30__SCNMaterial_setDoubleSided___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(unsigned __int8 *)(a1 + 40);

  C3DMaterialSetDoubleSided(v2, v3);
}

void __27__SCNMaterial_setCullMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  int v3 = *(_DWORD *)(a1 + 40);

  C3DMaterialSetCullMode(v2, v3);
}

void __27__SCNMaterial_setFillMode___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) materialRef];
  unsigned int v3 = *(_DWORD *)(a1 + 40);

  C3DMaterialSetFillMode(v2, v3);
}

- (NSString)description
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  unsigned int v3 = (void *)MEMORY[0x263F089D8];
  uint64_t v4 = (objc_class *)objc_opt_class();
  float v5 = (void *)[v3 stringWithFormat:@"<%@: %p", NSStringFromClass(v4), self];
  if ([(NSString *)[(SCNMaterial *)self name] length]) {
    [v5 appendFormat:@" '%@'", -[SCNMaterial name](self, "name")];
  }
  id v6 = [(SCNMaterial *)self properties];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v12 _hasDefaultValues] & 1) == 0)
        {
          [v5 appendFormat:@"\n  %@=%@", objc_msgSend(v12, "propertyName"), v12];
          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
    if (v9) {
      [v5 appendString:@"\n"];
    }
  }
  [v5 appendString:@">"];
  return (NSString *)v5;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 property:(id)a4
{
  id v6 = (void *)[NSString stringWithFormat:@"%@.%@", @"commonProfile", objc_msgSend(a4, "slotName")];
  if ([a3 isEqualToString:@"color"]
    || [a3 isEqualToString:@"contents"]
    || [a3 isEqualToString:@"content"])
  {
    uint64_t v7 = (__CFString *)[v6 stringByAppendingString:@".color"];
  }
  else
  {
    uint64_t v7 = (__CFString *)[v6 stringByAppendingFormat:@".%@", a3];
  }

  return SCNCreateAnimationChannelWithObjectAndPath(self, v7);
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id result = (id)[a3 length];
  if (result)
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      uint64_t v8 = [(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:a3];
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v8)
      {
        TargetedBaseint Type = SCNAnimationGetTargetedBaseType(a4);
        if (TargetedBaseType)
        {
          uint64_t v15 = SCNDefaultValueWithBaseType(TargetedBaseType, v11, v12, v13, v14);
          long long v16 = [(SCNMaterial *)self sceneRef];
          if (v16)
          {
            uint64_t v17 = (uint64_t)v16;
            C3DSceneLock((uint64_t)v16);
            +[SCNTransaction begin];
            +[SCNTransaction setImmediateMode:1];
            [(SCNMaterial *)self setValue:v15 forUndefinedKey:a3];
            +[SCNTransaction commitImmediate];
            C3DSceneUnlock(v17);
          }
          else
          {
            +[SCNTransaction begin];
            +[SCNTransaction setImmediateMode:1];
            [(SCNMaterial *)self setValue:v15 forUndefinedKey:a3];
            +[SCNTransaction commitImmediate];
          }
        }
        else
        {
          uint64_t v18 = scn_default_log();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412290;
            id v20 = a3;
            _os_log_impl(&dword_20B249000, v18, OS_LOG_TYPE_DEFAULT, "Warning: can't prepare shadable animation with path %@", (uint8_t *)&v19, 0xCu);
          }
        }
      }
    }
    id result = SCNCreateAnimationChannelWithObjectAndPath(self, (__CFString *)a3);
    if (!result)
    {
      char v9 = scn_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SCNMaterial copyAnimationChannelForKeyPath:animation:]();
      }
      return 0;
    }
  }
  return result;
}

- (id)scene
{
  id result = [(SCNMaterial *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNMaterial *)self sceneRef];
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
    char v9 = [(SCNMaterial *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      uint64_t v10 = scn_default_log();
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
    BOOL v8 = [(SCNMaterial *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__SCNMaterial_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    char v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial addAnimationPlayer:forKey:]();
    }
  }
}

void __41__SCNMaterial_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 36);
    [*((id *)a1[5] + 19) removeObjectForKey:a1[6]];
    uint64_t v2 = (os_unfair_lock_s *)((char *)a1[5] + 144);
    os_unfair_lock_unlock(v2);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    uint64_t v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNMaterial *)self addAnimationPlayer:v7 forKey:v5];
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
  uint64_t v4 = [(SCNMaterial *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__SCNMaterial_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __34__SCNMaterial_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  id v6 = [(SCNMaterial *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SCNMaterial_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __55__SCNMaterial_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    id v6 = [(SCNMaterial *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNMaterial_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __37__SCNMaterial_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNMaterial *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __54__SCNMaterial_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __54__SCNMaterial_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNMaterial *)self _scnAnimationForKey:a3];
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
  char v9 = [(SCNMaterial *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    double v11 = [(SCNMaterial *)self animationManager];
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
  BOOL v5 = [(SCNMaterial *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMaterial_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __36__SCNMaterial_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNMaterial *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SCNMaterial_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __37__SCNMaterial_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  BOOL v8 = [(SCNMaterial *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SCNMaterial_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __40__SCNMaterial_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMaterial *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNMaterial *)self __CFObject];
  if (v7)
  {
    BOOL v8 = v7;
    char v9 = [(SCNMaterial *)self animationManager];
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

    uint64_t v15 = [(SCNMaterial *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __63__SCNMaterial_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __63__SCNMaterial_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMaterial *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__SCNMaterial_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __36__SCNMaterial_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNMaterial *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__SCNMaterial_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __32__SCNMaterial_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

void __28__SCNMaterial_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = (id)[a3 copy];
  [*(id *)(a1 + 32) _shadableSetValue:v5 forUndefinedKey:a2];
}

- (__C3DMaterial)materialRefCreateIfNeeded
{
  return self->_material;
}

- (id)valueForUndefinedKey:(id)a3
{
  if (self->_isPresentationInstance)
  {
    CFStringRef v5 = C3DCFTypeCopyModelInfoAtPath((float32x4_t *)self->_material, (CFStringRef)a3, 0);
    if (v5)
    {
      CFStringRef v6 = v5;
      if (C3DModelTargetGetTargetAddress((uint64_t)v5))
      {
        TargetAddress = (float32x2_t *)C3DModelTargetGetTargetAddress((uint64_t)v6);
        Baseint Type = C3DModelTargetGetBaseType((uint64_t)v6);
        double v13 = (void *)SCNNSValueFromTypedBytes(TargetAddress, BaseType, v9, v10, v11, v12);
        CFRelease(v6);
        return v13;
      }
      CFRelease(v6);
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  id v15 = (id)[(NSMutableDictionary *)self->_valuesForUndefinedKeys objectForKey:a3];
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);

  return v15;
}

- (id)customMaterialPropertyNames
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SCNMaterial_customMaterialPropertyNames__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __42__SCNMaterial_customMaterialPropertyNames__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    CFStringRef v5 = *(void **)(a1 + 32);
    return [v5 addObject:a2];
  }
  return result;
}

- (id)customMaterialProperties
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SCNMaterial_customMaterialProperties__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNMaterial_customMaterialProperties__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    CFStringRef v6 = *(void **)(a1 + 32);
    return [v6 addObject:a3];
  }
  return result;
}

- (id)customMaterialAttributeNames
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SCNMaterial_customMaterialAttributeNames__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __43__SCNMaterial_customMaterialAttributeNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = _isValidCustomPropertyType(a3);
  if (result)
  {
    CFStringRef v6 = *(void **)(a1 + 32);
    return [v6 addObject:a2];
  }
  return result;
}

- (id)customMaterialAttributes
{
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  uint64_t v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_valuesForUndefinedKeys, "count"));
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SCNMaterial_customMaterialAttributes__block_invoke;
  v7[3] = &unk_264006110;
  v7[4] = v4;
  [(NSMutableDictionary *)valuesForUndefinedKeys enumerateKeysAndObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v4;
}

uint64_t __39__SCNMaterial_customMaterialAttributes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = _isValidCustomPropertyType(a3);
  if (result)
  {
    CFStringRef v6 = *(void **)(a1 + 32);
    return [v6 addObject:a3];
  }
  return result;
}

- (void)setMinimumLanguageVersion:(id)a3
{
  if (self->_isPresentationInstance)
  {
    uint64_t v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterial setMinimumLanguageVersion:]();
    }
  }
  else
  {
    if (a3) {
      [(SCNMaterial *)self _setupShadableHelperIfNeeded];
    }
    shadableHelper = self->_shadableHelper;
    [(SCNShadableHelper *)shadableHelper setMinimumLanguageVersion:a3];
  }
}

- (NSNumber)minimumLanguageVersion
{
  return [(SCNShadableHelper *)self->_shadableHelper minimumLanguageVersion];
}

- (id)shaderModifiersArgumentsNames
{
  return [(SCNShadableHelper *)self->_shadableHelper shaderModifiersArgumentsNames];
}

- (void)handleBindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  [(SCNMaterial *)self _setupShadableHelperIfNeeded];
  shadableHelper = self->_shadableHelper;

  [(SCNShadableHelper *)shadableHelper handleBindingOfSymbol:a3 usingBlock:a4];
}

- (void)handleUnbindingOfSymbol:(id)a3 usingBlock:(id)a4
{
  [(SCNMaterial *)self _setupShadableHelperIfNeeded];
  shadableHelper = self->_shadableHelper;

  [(SCNShadableHelper *)shadableHelper handleUnbindingOfSymbol:a3 usingBlock:a4];
}

+ (id)materialNamed:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return +[SCNAssetCatalog objectWithName:a3 class:v4];
}

- (void)_customDecodingOfSCNMaterial:(id)a3
{
  uint64_t v4 = (void *)[a3 decodeObjectOfClasses:SCNUserInfoClasses() forKey:@"valuesForUndefinedKeys"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __44__SCNMaterial__customDecodingOfSCNMaterial___block_invoke;
    v5[3] = &unk_264006110;
    v5[4] = self;
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

uint64_t __44__SCNMaterial__customDecodingOfSCNMaterial___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _shadableSetValue:a3 forUndefinedKey:a2];
}

- (void)_customEncodingOfSCNMaterial:(id)a3
{
  CFStringRef v5 = [(SCNMaterial *)self commonProfile];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if (C3DEffectCommonProfileGetEffectSlot((uint64_t)v5, 1, 0)) {
      [(SCNMaterial *)self _property:&self->_ambient];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 2, 0)) {
      [(SCNMaterial *)self _property:&self->_diffuse];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 3, 0)) {
      [(SCNMaterial *)self _property:&self->_specular];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 0, 0)) {
      [(SCNMaterial *)self _property:&self->_emission];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 6, 0)) {
      [(SCNMaterial *)self _property:&self->_multiply];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 4, 0)) {
      [(SCNMaterial *)self _property:&self->_reflective];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 5, 0)) {
      [(SCNMaterial *)self _property:&self->_transparent];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 7, 0)) {
      [(SCNMaterial *)self _property:&self->_normal];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 9, 0)) {
      [(SCNMaterial *)self _property:&self->_selfIllumination];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 8, 0)) {
      [(SCNMaterial *)self _property:&self->_ambientOcclusion];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 10, 0)) {
      [(SCNMaterial *)self _property:&self->_metalness];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 11, 0)) {
      [(SCNMaterial *)self _property:&self->_roughness];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 15, 0)) {
      [(SCNMaterial *)self _property:&self->_displacement];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 12, 0)) {
      [(SCNMaterial *)self _property:&self->_clearCoat];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 13, 0)) {
      [(SCNMaterial *)self _property:&self->_clearCoatRoughness];
    }
    if (C3DEffectCommonProfileGetEffectSlot(v6, 14, 0)) {
      [(SCNMaterial *)self _property:&self->_clearCoatNormal];
    }
  }
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys) {
    [a3 encodeObject:valuesForUndefinedKeys forKey:@"valuesForUndefinedKeys"];
  }
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_isPresentationInstance) {
    [(SCNMaterial *)self _syncObjCModel];
  }
  [(SCNMaterial *)self _customEncodingOfSCNMaterial:a3];
  ambient = self->_ambient;
  if (ambient) {
    [a3 encodeObject:ambient forKey:@"ambient"];
  }
  diffuse = self->_diffuse;
  if (diffuse) {
    [a3 encodeObject:diffuse forKey:@"diffuse"];
  }
  specular = self->_specular;
  if (specular) {
    [a3 encodeObject:specular forKey:@"specular"];
  }
  emission = self->_emission;
  if (emission) {
    [a3 encodeObject:emission forKey:@"emission"];
  }
  reflective = self->_reflective;
  if (reflective) {
    [a3 encodeObject:reflective forKey:@"reflective"];
  }
  transparent = self->_transparent;
  if (transparent) {
    [a3 encodeObject:transparent forKey:@"transparent"];
  }
  multiply = self->_multiply;
  if (multiply) {
    [a3 encodeObject:multiply forKey:@"multiply"];
  }
  normal = self->_normal;
  if (normal) {
    [a3 encodeObject:normal forKey:@"normal"];
  }
  selfIllumination = self->_selfIllumination;
  if (selfIllumination) {
    [a3 encodeObject:selfIllumination forKey:@"selfIllumination"];
  }
  ambientOcclusion = self->_ambientOcclusion;
  if (ambientOcclusion) {
    [a3 encodeObject:ambientOcclusion forKey:@"ambientOcclusion"];
  }
  metalness = self->_metalness;
  if (metalness) {
    [a3 encodeObject:metalness forKey:@"metalness"];
  }
  roughness = self->_roughness;
  if (roughness) {
    [a3 encodeObject:roughness forKey:@"roughness"];
  }
  displacement = self->_displacement;
  if (displacement) {
    [a3 encodeObject:displacement forKey:@"displacement"];
  }
  clearCoat = self->_clearCoat;
  if (clearCoat) {
    [a3 encodeObject:clearCoat forKey:@"clearCoat"];
  }
  clearCoatRoughness = self->_clearCoatRoughness;
  if (clearCoatRoughness) {
    [a3 encodeObject:clearCoatRoughness forKey:@"clearCoatRoughness"];
  }
  clearCoatNormal = self->_clearCoatNormal;
  if (clearCoatNormal) {
    [a3 encodeObject:clearCoatNormal forKey:@"clearCoatNormal"];
  }
  name = self->_name;
  objc_opt_class();
  SCNEncodeNamedObject(a3, (const char *)name);
  *(float *)&double v22 = self->_shininess;
  [a3 encodeFloat:@"shininess" forKey:v22];
  *(float *)&double v23 = self->_transparency;
  [a3 encodeFloat:@"transparency" forKey:v23];
  *(float *)&double v24 = self->_indexOfRefraction;
  [a3 encodeFloat:@"indexOfRefraction" forKey:v24];
  *(float *)&double v25 = self->_fresnelExponent;
  [a3 encodeFloat:@"fresnelExponent" forKey:v25];
  [a3 encodeInteger:self->_transparencyMode forKey:@"transparencyMode"];
  lightingModelName = self->_lightingModelName;
  if (lightingModelName) {
    [a3 encodeObject:lightingModelName forKey:@"lightingModelName"];
  }
  [a3 encodeInteger:self->_cullMode forKey:@"cullMode"];
  shadableHelper = self->_shadableHelper;
  if (shadableHelper) {
    [a3 encodeObject:shadableHelper forKey:@"shadableHelper"];
  }
  [a3 encodeBool:self->_litPerPixel forKey:@"litPerPixel"];
  [a3 encodeBool:self->_doubleSided forKey:@"doubleSided"];
  [a3 encodeBool:self->_locksAmbientWithDiffuse forKey:@"locksAmbientWithDiffuse"];
  [a3 encodeBool:self->_avoidsOverLighting forKey:@"avoidsOverLighting"];
  [a3 encodeBool:self->_writesToDepthBuffer forKey:@"writesToDepthBuffer"];
  [a3 encodeBool:self->_readsFromDepthBuffer forKey:@"readsFromDepthBuffer"];
  [a3 encodeInteger:self->_colorBufferWriteMask forKey:@"colorBufferWriteMask"];
  [a3 encodeInteger:SCNFillModeToSCNLegacyFillMode[self->_fillMode] forKey:@"fillMode"];
  [a3 encodeInteger:self->_blendMode forKey:@"blendMode"];
  *(float *)&double v28 = self->_selfIlluminationOcclusion;
  [a3 encodeFloat:@"selfIlluminationOcclusion" forKey:v28];
  SCNEncodeEntity(a3, self);

  SCNEncodeAnimations(a3, self);
}

- (SCNMaterial)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SCNMaterial;
  uint64_t v4 = [(SCNMaterial *)&v16 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = C3DMaterialCreate();
    v4->_material = (__C3DMaterial *)v6;
    if (v6) {
      C3DEntitySetObjCWrapper(v6, v4);
    }
    [(SCNMaterial *)v4 _syncObjCModel];
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    [(SCNMaterial *)v4 _customDecodingOfSCNMaterial:a3];
    v4->_ambient = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"ambient");
    v4->_diffuse = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"diffuse");
    v4->_specular = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"specular");
    v4->_emission = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"emission");
    v4->_reflective = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"reflective");
    v4->_transparent = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"transparent");
    v4->_multiply = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"multiply");
    v4->_normal = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"normal");
    if ([a3 containsValueForKey:@"selfIllumination"]) {
      v4->_selfIllumination = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"selfIllumination");
    }
    if ([a3 containsValueForKey:@"ambientOcclusion"]) {
      v4->_ambientOcclusion = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"ambientOcclusion");
    }
    if ([a3 containsValueForKey:@"metalness"]) {
      v4->_metalness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"metalness");
    }
    if ([a3 containsValueForKey:@"roughness"]) {
      v4->_roughness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"roughness");
    }
    if ([a3 containsValueForKey:@"displacement"]) {
      v4->_displacement = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"displacement");
    }
    if ([a3 containsValueForKey:@"clearCoat"]) {
      v4->_clearCoat = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"clearCoat");
    }
    if ([a3 containsValueForKey:@"clearCoatRoughness"]) {
      v4->_clearCoatRoughness = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"clearCoatRoughness");
    }
    if ([a3 containsValueForKey:@"clearCoatNormal"]) {
      v4->_clearCoatNormal = (SCNMaterialProperty *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"clearCoatNormal");
    }
    -[SCNMaterial setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    [a3 decodeFloatForKey:@"shininess"];
    [(SCNMaterial *)v4 setShininess:v7];
    [a3 decodeFloatForKey:@"transparency"];
    [(SCNMaterial *)v4 setTransparency:v8];
    [a3 decodeFloatForKey:@"indexOfRefraction"];
    [(SCNMaterial *)v4 setIndexOfRefraction:v9];
    [a3 decodeFloatForKey:@"fresnelExponent"];
    [(SCNMaterial *)v4 setFresnelExponent:v10];
    -[SCNMaterial setTransparencyMode:](v4, "setTransparencyMode:", [a3 decodeIntegerForKey:@"transparencyMode"]);
    -[SCNMaterial setLightingModelName:](v4, "setLightingModelName:", objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"lightingModelName"));
    -[SCNMaterial setCullMode:](v4, "setCullMode:", [a3 decodeIntegerForKey:@"cullMode"]);
    double v11 = (SCNShadableHelper *)(id)objc_msgSend(a3, "scn_decodeObjectOfClass:forKey:", objc_opt_class(), @"shadableHelper");
    v4->_shadableHelper = v11;
    if ([(SCNShadableHelper *)v11 owner] != v4)
    {

      v4->_shadableHelper = 0;
    }
    -[SCNMaterial setLitPerPixel:](v4, "setLitPerPixel:", [a3 decodeBoolForKey:@"litPerPixel"]);
    -[SCNMaterial setDoubleSided:](v4, "setDoubleSided:", [a3 decodeBoolForKey:@"doubleSided"]);
    -[SCNMaterial setLocksAmbientWithDiffuse:](v4, "setLocksAmbientWithDiffuse:", [a3 decodeBoolForKey:@"locksAmbientWithDiffuse"]);
    -[SCNMaterial setAvoidsOverLighting:](v4, "setAvoidsOverLighting:", [a3 decodeBoolForKey:@"avoidsOverLighting"]);
    -[SCNMaterial setWritesToDepthBuffer:](v4, "setWritesToDepthBuffer:", [a3 decodeBoolForKey:@"writesToDepthBuffer"]);
    if ([a3 containsValueForKey:@"colorBufferWriteMask"]) {
      -[SCNMaterial setColorBufferWriteMask:](v4, "setColorBufferWriteMask:", [a3 decodeIntegerForKey:@"colorBufferWriteMask"]);
    }
    -[SCNMaterial setReadsFromDepthBuffer:](v4, "setReadsFromDepthBuffer:", [a3 decodeBoolForKey:@"readsFromDepthBuffer"]);
    uint64_t v12 = [a3 decodeIntegerForKey:@"fillMode"];
    uint64_t v13 = 2;
    if (v12 < 2) {
      uint64_t v13 = v12;
    }
    [(SCNMaterial *)v4 setFillMode:SCNFillModeFromSCNLegacyFillMode[v13 & ~(v13 >> 63)]];
    -[SCNMaterial setBlendMode:](v4, "setBlendMode:", [a3 decodeIntegerForKey:@"blendMode"]);
    [a3 decodeFloatForKey:@"selfIlluminationOcclusion"];
    [(SCNMaterial *)v4 setSelfIlluminationOcclusion:v14];
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)debugQuickLookObject
{
  CFStringRef v3 = +[SCNSphere sphereWithRadius:1.0];
  [(SCNGeometry *)v3 setFirstMaterial:self];

  return [(SCNGeometry *)v3 debugQuickLookObject];
}

- (id)debugQuickLookData
{
  uint64_t v2 = [(SCNMaterial *)self debugQuickLookObject];

  return UIImagePNGRepresentation(v2);
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_setupMaterialProperty:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: _setupMaterialProperty -- should not reach", v1, 2u);
}

- (void)copyAnimationChannelForKeyPath:animation:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Material : %@ is not an animatable path", v2, v3, v4, v5, v6);
}

- (void)addAnimationPlayer:forKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: attempt to add a null animation player on %@", v2, v3, v4, v5, v6);
}

- (void)addAnimation:forKey:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: attempt to add a null animation on %@", v2, v3, v4, v5, v6);
}

- (void)_shadableSetValue:forUndefinedKey:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setShaderModifiers:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMinimumLanguageVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setProgram:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)_customEncodingOfSCNMaterial:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_20B249000, v1, OS_LOG_TYPE_ERROR, "Error: Failed to archive material's custom attributes. %@ %@", v2, 0x16u);
}

@end