@interface SCNMaterialProperty
+ (BOOL)supportsSecureCoding;
+ (SCNMaterialProperty)materialPropertyWithContents:(id)contents;
+ (__C3DImage)_createC3DImageFromImage:(id)a3;
+ (__C3DImage)copyC3DImageFromImage:(id)a3;
+ (__C3DImage)copyC3DImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5;
+ (id)_copyImageFromC3DImage:(__C3DImage *)a3;
+ (id)captureDeviceOutputConsumer;
+ (id)captureDeviceOutputConsumerWithOptions:(id)a3;
+ (id)copyImageFromC3DImage:(__C3DImage *)a3;
+ (id)dvt_supportedTypesForPropertyContents;
+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4;
+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4;
+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)_hasDefaultValues;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)sRGBTexture;
- (C3DColor4)borderColor4;
- (C3DColor4)color4;
- (CGFloat)intensity;
- (CGFloat)maxAnisotropy;
- (NSArray)animationKeys;
- (NSInteger)mappingChannel;
- (NSString)description;
- (SCNColorMask)textureComponents;
- (SCNFilterMode)magnificationFilter;
- (SCNFilterMode)minificationFilter;
- (SCNFilterMode)mipFilter;
- (SCNMaterialProperty)init;
- (SCNMaterialProperty)initWithCoder:(id)a3;
- (SCNMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4;
- (SCNMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4;
- (SCNMatrix4)contentsTransform;
- (SCNWrapMode)wrapS;
- (SCNWrapMode)wrapT;
- (__C3DAnimationManager)animationManager;
- (__C3DEffectCommonProfile)commonProfile;
- (__C3DEffectSlot)effectSlot;
- (__C3DEffectSlot)effectSlotCreateIfNeeded:(BOOL)a3;
- (__C3DScene)sceneRef;
- (__C3DTextureSampler)textureSampler;
- (char)propertyType;
- (id)UIView;
- (id)__runtimeResolvedPath;
- (id)_animationPathForKey:(id)a3;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)attachment;
- (id)avPlayer;
- (id)borderColor;
- (id)captureDevice;
- (id)captureDeviceOutputConsumerSource;
- (id)color;
- (id)contents;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)floatValue;
- (id)image;
- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3;
- (id)layer;
- (id)mtlTexture;
- (id)parent;
- (id)precomputedLightingEnvironment;
- (id)presentationMaterialProperty;
- (id)proceduralContents;
- (id)propertyName;
- (id)pvrtcData;
- (id)skScene;
- (id)skTexture;
- (id)textureProvider;
- (int)_textureOptions;
- (int64_t)_presentationMappingChannel;
- (void)__CFObject;
- (void)__allocateContentTransformIfNeeded;
- (void)_clearContents;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customEncodingOfSCNMaterialProperty:(id)a3;
- (void)_didDecodeSCNMaterialProperty:(id)a3;
- (void)_layerDidChange:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_setC3DImageRef:(__C3DImage *)a3;
- (void)_setColor:(id)a3;
- (void)_setImagePath:(id)a3 withResolvedPath:(id)a4;
- (void)_setParent:(id)a3;
- (void)_setupContentsFromC3DImage;
- (void)_skSceneDidChange:(id)a3;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateC3DImageWithContents:(id)a3;
- (void)_updateMaterialAVPlayer:(id)a3;
- (void)_updateMaterialAttachment:(id)a3;
- (void)_updateMaterialBorderColor:(id)a3;
- (void)_updateMaterialCaptureDevice:(id)a3;
- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3;
- (void)_updateMaterialColor:(id)a3;
- (void)_updateMaterialFilters;
- (void)_updateMaterialImage:(id)a3;
- (void)_updateMaterialLayer:(id)a3;
- (void)_updateMaterialMTLTexture:(id)a3;
- (void)_updateMaterialNumber:(id)a3;
- (void)_updateMaterialProceduralContents:(id)a3;
- (void)_updateMaterialPropertyTransform:(C3DMatrix4x4 *)a3;
- (void)_updateMaterialSKScene:(id)a3;
- (void)_updateMaterialSKTexture:(id)a3;
- (void)_updateMaterialTextureProvider:(id)a3;
- (void)_updateMaterialUIComponent:(id)a3;
- (void)_updatePrecomputedLightingEnvironment:(id)a3;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)copyPropertiesFrom:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)getC3DImageRef;
- (void)image;
- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4;
- (void)parentWillDie:(id)a3;
- (void)pauseAnimationForKey:(id)a3;
- (void)propertyName;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setAttachment:(id)a3;
- (void)setAvPlayer:(id)a3;
- (void)setBorderColor:(id)borderColor;
- (void)setCaptureDevice:(id)a3;
- (void)setCaptureDeviceOutputConsumerSource:(id)a3;
- (void)setColor:(id)a3;
- (void)setContents:(id)contents;
- (void)setContentsTransform:(SCNMatrix4 *)contentsTransform;
- (void)setFloatValue:(id)a3;
- (void)setImage:(id)a3;
- (void)setIntensity:(CGFloat)intensity;
- (void)setLayer:(id)a3;
- (void)setMagnificationFilter:(SCNFilterMode)magnificationFilter;
- (void)setMappingChannel:(NSInteger)mappingChannel;
- (void)setMaxAnisotropy:(CGFloat)maxAnisotropy;
- (void)setMinificationFilter:(SCNFilterMode)minificationFilter;
- (void)setMipFilter:(SCNFilterMode)mipFilter;
- (void)setMtlTexture:(id)a3;
- (void)setPrecomputedLightingEnvironment:(id)a3;
- (void)setProceduralContents:(id)a3;
- (void)setSRGBTexture:(BOOL)a3;
- (void)setSkScene:(id)a3;
- (void)setSkTexture:(id)a3;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setTextureComponents:(SCNColorMask)textureComponents;
- (void)setTextureProvider:(id)a3;
- (void)setUIView:(id)a3;
- (void)setUIWindow:(id)a3;
- (void)setWrapS:(SCNWrapMode)wrapS;
- (void)setWrapT:(SCNWrapMode)wrapT;
- (void)unbindAnimatablePath:(id)a3;
- (void)unlinkCustomPropertyWithParent:(id)a3;
@end

@implementation SCNMaterialProperty

- (void)_updateC3DImageWithContents:(id)a3
{
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    CFRelease(c3dImage);
    self->_c3dImage = 0;
  }
  char v11 = 0;
  v6 = +[SCNMaterialProperty copyC3DImageFromImage:a3 textureOptions:[(SCNMaterialProperty *)self _textureOptions] wasCached:&v11];
  v7 = v6;
  if (v6) {
    BOOL v8 = v11 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8 && (*((unsigned char *)self + 8) & 8) == 0) {
    C3DImageCacheBitmap((uint64_t)v6);
  }
  v9 = [(SCNMaterialProperty *)self sceneRef];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51__SCNMaterialProperty__updateC3DImageWithContents___block_invoke;
  v10[3] = &unk_264006160;
  v10[4] = self;
  v10[5] = v7;
  +[SCNTransaction postCommandWithContext:v9 object:self applyBlock:v10];
}

- (void)setTextureComponents:(SCNColorMask)textureComponents
{
  if (self->_textureComponents != textureComponents)
  {
    self->_textureComponents = textureComponents;
    v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __44__SCNMaterialProperty_setTextureComponents___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    v6[5] = textureComponents;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)_updateMaterialFilters
{
  v3 = [(SCNMaterialProperty *)self effectSlot];
  if (v3)
  {
    uint64_t v4 = (uint64_t)v3;
    uint64_t TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v3);
    int minificationFilter = self->_minificationFilter;
    int magnificationFilter = self->_magnificationFilter;
    int mipFilter = self->_mipFilter;
    int wrapS = self->_wrapS;
    int wrapT = self->_wrapT;
    if (TextureSampler) {
      int WrapModeP = C3DTextureSamplerGetWrapModeP(TextureSampler);
    }
    else {
      int WrapModeP = 2;
    }
    uint64_t v12 = [(SCNMaterialProperty *)self borderColor4];
    v14 = (const void *)C3DTextureSamplerCreateEx(minificationFilter, magnificationFilter, mipFilter, wrapS, wrapT, WrapModeP, v12, v13, self->_maxAnisotropy);
    C3DEffectSlotSetTextureSampler(v4, v14);
    CFRelease(v14);
  }
}

- (__C3DEffectSlot)effectSlot
{
  return [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:1];
}

- (C3DColor4)borderColor4
{
  v2 = (void *)scn_NSColorFromCGColorIfApplicable(self->_borderColor);

  uint64_t v3 = objc_msgSend(v2, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  *(void *)&result.var0.var1.var2 = v4;
  *(void *)result.var0.var0 = v3;
  return result;
}

- (__C3DEffectSlot)effectSlotCreateIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  switch(self->_propertyType)
  {
    case 0x16:
      C3DColor4 result = (__C3DEffectSlot *)[self->_parent lightRef];
      if (result)
      {
        C3DColor4 result = (__C3DEffectSlot *)C3DLightGetGobo((uint64_t)result, v3);
      }
      break;
    case 0x18:
      C3DColor4 result = (__C3DEffectSlot *)[self->_parent sceneRef];
      if (result)
      {
        C3DColor4 result = (__C3DEffectSlot *)C3DSceneGetBackgroundEffectSlot((uint64_t)result, v3);
      }
      break;
    case 0x19:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        C3DColor4 result = (__C3DEffectSlot *)[self->_parent sceneRef];
        if (result)
        {
          C3DColor4 result = (__C3DEffectSlot *)C3DSceneGetLightingEnvironmentEffectSlot((uint64_t)result, v3);
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          C3DColor4 result = (__C3DEffectSlot *)[self->_parent lightRef];
          if (result)
          {
            C3DColor4 result = (__C3DEffectSlot *)C3DLightGetProbeEnvironment((uint64_t)result, v3);
          }
        }
        else
        {
          C3DColor4 result = 0;
        }
      }
      break;
    case 0x1A:
      C3DColor4 result = (__C3DEffectSlot *)[self->_parent cameraRef];
      if (result)
      {
        C3DColor4 result = (__C3DEffectSlot *)C3DCameraGetColorGradingEffectSlot((uint64_t)result, v3);
      }
      break;
    case 0x1B:
      C3DColor4 result = self->_customSlot;
      break;
    default:
      C3DColor4 result = [(SCNMaterialProperty *)self commonProfile];
      if (result)
      {
        int propertyType = self->_propertyType;
        C3DColor4 result = (__C3DEffectSlot *)C3DEffectCommonProfileGetEffectSlot((uint64_t)result, propertyType, v3);
      }
      break;
  }
  return result;
}

- (__C3DEffectCommonProfile)commonProfile
{
  if ((*((unsigned char *)self + 8) & 2) != 0) {
    return (__C3DEffectCommonProfile *)[self->_parent commonProfile];
  }
  else {
    return 0;
  }
}

- (void)_setC3DImageRef:(__C3DImage *)a3
{
  c3dImage = self->_c3dImage;
  if (c3dImage != a3)
  {
    if (c3dImage)
    {
      CFRelease(c3dImage);
      self->_c3dImage = 0;
    }
    if (a3) {
      v6 = (__C3DImage *)CFRetain(a3);
    }
    else {
      v6 = 0;
    }
    self->_c3dImage = v6;
  }
}

- (SCNMaterialProperty)initWithParent:(id)a3 propertyType:(char)a4
{
  int v4 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SCNMaterialProperty;
  v6 = [(SCNMaterialProperty *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v6 == a3) {
      id v8 = 0;
    }
    else {
      id v8 = a3;
    }
    v6->_parent = v8;
    v6->_int propertyType = v4;
    *((unsigned char *)v6 + 8) = *((unsigned char *)v6 + 8) & 0xFD | (2 * (v4 < 21));
    if (!v8) {
      v6->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
    }
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNMaterialProperty *)v7 _syncObjCModel];
    [(SCNMaterialProperty *)v7 _syncObjCAnimations];
  }
  return v7;
}

- (void)_setupContentsFromC3DImage
{
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    if (C3DImageIsCatalogTexture((uint64_t)c3dImage))
    {

      id v4 = (id)C3DImageGetCatalogTextureName((uint64_t)self->_c3dImage);
LABEL_7:
      self->_contents = v4;
      self->_contentType = 1;
      return;
    }
    id URL = (id)C3DImageGetURL((uint64_t)self->_c3dImage);
    if (URL
      || (id URL = +[SCNMaterialProperty copyImageFromC3DImage:self->_c3dImage]) != 0)
    {
      v6 = URL;

      id v4 = v6;
      goto LABEL_7;
    }
  }
}

- (void)_setColor:(id)a3
{
  if (self->_contents != a3)
  {
    self->_contents = a3;
    self->_contentType = 0;
  }
}

uint64_t __32__SCNMaterialProperty_setWrapT___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialFilters];
}

uint64_t __32__SCNMaterialProperty_setWrapS___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialFilters];
}

- (void)setWrapT:(SCNWrapMode)wrapT
{
  int v3 = wrapT;
  if ((unint64_t)(wrapT - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    if (self->_wrapT != wrapT)
    {
      self->_int wrapT = wrapT;
      v6 = [(SCNMaterialProperty *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNMaterialProperty_setWrapT___block_invoke;
      v7[3] = &unk_264005010;
      v7[4] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
    }
  }
  else
  {
    id v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterialProperty setWrapT:](v3, v4);
    }
  }
}

- (void)setWrapS:(SCNWrapMode)wrapS
{
  int v3 = wrapS;
  if ((unint64_t)(wrapS - 5) > 0xFFFFFFFFFFFFFFFBLL)
  {
    if (self->_wrapS != wrapS)
    {
      self->_int wrapS = wrapS;
      v6 = [(SCNMaterialProperty *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNMaterialProperty_setWrapS___block_invoke;
      v7[3] = &unk_264005010;
      v7[4] = self;
      +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
    }
  }
  else
  {
    id v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterialProperty setWrapS:](v3, v4);
    }
  }
}

- (void)_syncObjCAnimations
{
  int v3 = [(SCNMaterialProperty *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v5 = [(SCNMaterialProperty *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      v7 = scn_default_log();
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

- (void)__CFObject
{
  return objc_msgSend(self->_parent, "__CFObject");
}

- (void)_syncObjCModel
{
  int v3 = [(SCNMaterialProperty *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  v5 = [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:0];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    uint64_t TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v5);
    if (TextureSampler || (uint64_t TextureSampler = C3DTextureSamplerGetDefault()) != 0)
    {
      self->_int minificationFilter = C3DTextureSamplerGetMinFilter(TextureSampler);
      self->_int magnificationFilter = C3DTextureSamplerGetMagFilter(TextureSampler);
      self->_int mipFilter = C3DTextureSamplerGetMipFilter(TextureSampler);
      self->_int wrapS = C3DTextureSamplerGetWrapModeS(TextureSampler);
      self->_int wrapT = C3DTextureSamplerGetWrapModeT(TextureSampler);
      self->_borderColor = (UIColor *)(id)objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DTextureSamplerGetBorderColor(TextureSampler));
      self->_maxAnisotropy = C3DTextureSamplerGetAnisotropy(TextureSampler);
    }
    self->_mappingChannel = [(SCNMaterialProperty *)self _presentationMappingChannel];
    self->_textureComponents = C3DEffectSlotGetTextureComponents(v6);
    self->_intensity = C3DEffectSlotGetIntensity(v6);
    if (C3DEffectSlotGetSRGB(v6)) {
      char v8 = 4;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v8;
    if (C3DKeyframeControllerHasInterpolationModesPerKey(v6))
    {
      [(SCNMaterialProperty *)self __allocateContentTransformIfNeeded];
      uint64_t ImageTransform = C3DEffectSlotGetImageTransform(v6);
      C3DMatrix4x4ToSCNMatrix4(ImageTransform, (_OWORD *)&self->_contentTransform->m11);
      if (!v4) {
        return;
      }
    }
    else
    {
      free(self->_contentTransform);
      self->_contentTransform = 0;
      if (!v4) {
        return;
      }
    }
    goto LABEL_22;
  }
  *(_WORD *)&self->_int minificationFilter = 514;
  self->_int mipFilter = C3DWasLinkedBeforeMajorOSYear2016() ^ 1;
  *(_WORD *)&self->_int wrapS = 257;
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&self->_intensity = _D0;
  unsigned int propertyType = self->_propertyType;
  if (propertyType == 15) {
    unsigned __int8 v16 = 8;
  }
  else {
    unsigned __int8 v16 = 15;
  }
  self->_textureComponents = v16;
  if (C3DEffectSlotDefaultSRGBForPropertyType(propertyType)) {
    char v17 = 4;
  }
  else {
    char v17 = 0;
  }
  *((unsigned char *)self + 8) = *((unsigned char *)self + 8) & 0xFB | v17;
  if (v4)
  {
LABEL_22:
    C3DSceneUnlock(v4);
  }
}

- (__C3DScene)sceneRef
{
  return (__C3DScene *)[self->_parent sceneRef];
}

uint64_t __37__SCNMaterialProperty_setFloatValue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialNumber:*(void *)(a1 + 40)];
}

uint64_t __32__SCNMaterialProperty_setColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialColor:*(void *)(a1 + 40)];
}

void __44__SCNMaterialProperty_setTextureComponents___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectSlotCreateIfNeeded:*(void *)(a1 + 40) != 15];
  if (v2)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    C3DEffectSlotSetTextureComponents(v2, v3);
  }
}

- (int)_textureOptions
{
  int v3 = [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:0];
  if (v3)
  {
    return C3DEffectSlotGetTextureOptions((uint64_t)v3);
  }
  else
  {
    int propertyType = self->_propertyType;
    int v6 = (*((unsigned __int8 *)self + 8) >> 2) & 1;
    return C3DEffectSlotGetDefaultTextureOptions(propertyType, v6);
  }
}

+ (__C3DImage)copyC3DImageFromImage:(id)a3 textureOptions:(int)a4 wasCached:(BOOL *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  uint64_t v6 = *(void *)&a4;
  CFTypeID v8 = CFGetTypeID(a3);
  if (v8 != C3DImageGetTypeID())
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    objc_opt_class();
    unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    char v12 = isKindOfClass ^ 1;
    if (objc_opt_isKindOfClass())
    {
      if ([a3 count] != 6)
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          +[SCNMaterialProperty copyC3DImageFromImage:textureOptions:wasCached:]();
        }
        IfNeededForSource = 0;
        if (!a5) {
          goto LABEL_35;
        }
        char v20 = 0;
        goto LABEL_34;
      }
      uint64_t v13 = 0;
      memset(v31, 0, 48);
      long long v21 = 0x8400102uLL;
      do
      {
        uint64_t v14 = objc_msgSend(a1, "copyC3DImageFromImage:textureOptions:wasCached:", objc_msgSend(a3, "objectAtIndexedSubscript:", v13, v21), v6, 0);
        if (!v14)
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = [a3 objectAtIndexedSubscript:v13];
            *(_DWORD *)buf = v21;
            uint64_t v30 = v16;
            _os_log_impl(&dword_20B249000, v15, OS_LOG_TYPE_DEFAULT, "Warning: copyC3DImageFromImage: invalid sub-image %@\n", buf, 0xCu);
          }
        }
        v31[v13++] = v14;
      }
      while (v13 != 6);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __70__SCNMaterialProperty_copyC3DImageFromImage_textureOptions_wasCached___block_invoke;
      v24[3] = &unk_2640090B0;
      v24[4] = &v25;
      v24[5] = v31;
      IfNeededForSource = (__C3DImage *)C3DImageCopyCachedImageOrCreateIfNeededForSource(a3, v12 & 1, (uint64_t)v24);
      for (uint64_t i = 0; i != 6; ++i)
      {
        v18 = (const void *)v31[i];
        if (v18)
        {
          CFRelease(v18);
          v31[i] = 0;
        }
      }
      if (!IfNeededForSource)
      {
LABEL_32:
        if (!a5)
        {
LABEL_35:
          _Block_object_dispose(&v25, 8);
          return IfNeededForSource;
        }
        char v20 = *((unsigned char *)v26 + 24) ^ 1;
LABEL_34:
        *a5 = v20;
        goto LABEL_35;
      }
    }
    else
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __70__SCNMaterialProperty_copyC3DImageFromImage_textureOptions_wasCached___block_invoke_2;
      v23[3] = &unk_2640090D8;
      v23[4] = a1;
      v23[5] = a3;
      v23[6] = &v25;
      IfNeededForSource = (__C3DImage *)C3DImageCopyCachedImageOrCreateIfNeededForSource(a3, (isKindOfClass ^ 1) & 1, (uint64_t)v23);
      if (!IfNeededForSource) {
        goto LABEL_32;
      }
    }
    if (*((unsigned char *)v26 + 24))
    {
      if ((v6 & 2) != 0)
      {
        C3DWasLinkedBeforeMajorOSYear2016();
        C3DImageChangeImageTypeToCubeMapIfSuitable(IfNeededForSource);
      }
      if ((v6 & 8) != 0) {
        C3DImageChangeImageTypeTo3DIfSuitable((uint64_t)IfNeededForSource);
      }
    }
    goto LABEL_32;
  }
  if (a5) {
    *a5 = 1;
  }

  return (__C3DImage *)a3;
}

uint64_t __51__SCNMaterialProperty__updateC3DImageWithContents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialImage:*(void *)(a1 + 40)];
}

void __36__SCNMaterialProperty_setIntensity___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectSlot];
  if (v2)
  {
    float v3 = *(double *)(a1 + 40);
    C3DEffectSlotSetIntensity(v2, v3);
  }
}

void __41__SCNMaterialProperty_setMappingChannel___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) effectSlotCreateIfNeeded:*(void *)(a1 + 40) != 0];
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    C3DEffectSlotSetUVSet(v2, v3);
  }
}

- (int64_t)_presentationMappingChannel
{
  uint64_t v2 = [(SCNMaterialProperty *)self effectSlot];
  if (!v2) {
    return -1;
  }

  return C3DEffectSlotGetUVSet((uint64_t)v2);
}

uint64_t __57__SCNMaterialProperty_setPrecomputedLightingEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePrecomputedLightingEnvironment:*(void *)(a1 + 40)];
}

- (void)_updatePrecomputedLightingEnvironment:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    C3DEffectSlotSetPrecomputedLightingEnvironment((uint64_t)v4, a3);
  }
}

- (void)setIntensity:(CGFloat)intensity
{
  if (self->_intensity != intensity)
  {
    float v5 = intensity;
    self->_intensity = v5;
    uint64_t v6 = [(SCNMaterialProperty *)self sceneRef];
    id v7 = [(SCNMaterialProperty *)self _animationPathForKey:@"intensity"];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__SCNMaterialProperty_setIntensity___block_invoke;
    v8[3] = &unk_264004FC0;
    v8[4] = self;
    *(CGFloat *)&v8[5] = intensity;
    +[SCNTransaction postCommandWithContext:v6 object:self keyPath:v7 applyBlock:v8];
  }
}

- (void)setImage:(id)a3
{
  if (self->_contents == a3)
  {
    if (a3) {
      return;
    }
    c3dImage = self->_c3dImage;
    if (!c3dImage) {
      return;
    }
    goto LABEL_3;
  }
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
LABEL_3:
    CFRetain(c3dImage);
    [(SCNMaterialProperty *)self _clearContents];
    self->_contents = a3;
    self->_contentType = 1;
    [(SCNMaterialProperty *)self _updateC3DImageWithContents:a3];
    CFRelease(c3dImage);
    return;
  }
  [(SCNMaterialProperty *)self _clearContents];
  self->_contents = a3;
  self->_contentType = 1;

  [(SCNMaterialProperty *)self _updateC3DImageWithContents:a3];
}

- (void)setColor:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_contents = a3;
    self->_contentType = 0;
    if (a3)
    {
      float v5 = [(SCNMaterialProperty *)self sceneRef];
      id v6 = [(SCNMaterialProperty *)self _animationPathForKey:@"color"];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNMaterialProperty_setColor___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      void v7[5] = a3;
      +[SCNTransaction postCommandWithContext:v5 object:self keyPath:v6 applyBlock:v7];
    }
  }
}

- (void)setFloatValue:(id)a3
{
  id contents = self->_contents;
  if (contents != a3 && (objc_msgSend(contents, "isEqual:") & 1) == 0)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_contentType = 9;
    if (a3)
    {
      id v6 = [(SCNMaterialProperty *)self sceneRef];
      id v7 = [(SCNMaterialProperty *)self _animationPathForKey:@"color"];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __37__SCNMaterialProperty_setFloatValue___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:v6 object:self keyPath:v7 applyBlock:v8];
    }
  }
}

- (void)_clearContents
{
  unsigned int contentType = self->_contentType;
  BOOL v4 = contentType > 0xD;
  int v5 = (1 << contentType) & 0x3D0C;
  if (!v4 && v5 != 0)
  {
    id contents = self->_contents;
    if (contents)
    {
      v11[0] = 0;
      v11[1] = v11;
      v11[2] = 0x3052000000;
      v11[3] = __Block_byref_object_copy__8;
      v11[4] = __Block_byref_object_dispose__8;
      v11[5] = contents;
      CFTypeID v8 = [(SCNMaterialProperty *)self sceneRef];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __37__SCNMaterialProperty__clearContents__block_invoke;
      v10[3] = &unk_264009060;
      v10[4] = v11;
      +[SCNTransaction postCommandWithContext:v8 object:0 applyBlock:v10];
      _Block_object_dispose(v11, 8);
    }
  }
  c3dImage = self->_c3dImage;
  if (c3dImage)
  {
    CFRelease(c3dImage);
    self->_c3dImage = 0;
  }

  self->_id contents = 0;
}

- (id)_animationPathForKey:(id)a3
{
  BOOL v4 = objc_msgSend(-[SCNMaterialProperty slotName](self, "slotName"), "stringByAppendingString:", @".");

  return (id)[v4 stringByAppendingString:a3];
}

- (id)propertyName
{
  [(SCNMaterialProperty *)self propertyType];
  id result = @"diffuse";
  switch(@"diffuse")
  {
    case 0u:
      id result = @"emission";
      break;
    case 1u:
      id result = @"ambient";
      break;
    case 2u:
      return result;
    case 3u:
      id result = @"specular";
      break;
    case 4u:
      id result = @"reflective";
      break;
    case 5u:
      id result = @"transparent";
      break;
    case 6u:
      id result = @"multiply";
      break;
    case 7u:
      id result = @"normal";
      break;
    case 8u:
      id result = @"ambientOcclusion";
      break;
    case 9u:
      id result = @"selfIllumination";
      break;
    case 0xAu:
      id result = @"metalness";
      break;
    case 0xBu:
      id result = @"roughness";
      break;
    case 0xCu:
      id result = @"clearCoat";
      break;
    case 0xDu:
      id result = @"clearCoatRoughness";
      break;
    case 0xEu:
      id result = @"clearCoatNormal";
      break;
    case 0xFu:
      id result = @"displacement";
      break;
    case 0x16u:
      id result = @"gobo";
      break;
    case 0x17u:
      id result = @"ies";
      break;
    case 0x18u:
      id result = @"background";
      break;
    case 0x19u:
      [(SCNMaterialProperty *)self parent];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id result = @"probeEnvironment";
      }
      else {
        id result = @"environment";
      }
      break;
    case 0x1Au:
      id result = @"colorGrading";
      break;
    case 0x1Bu:
      id result = self->_customSlotName;
      break;
    default:
      BOOL v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        [(SCNMaterialProperty *)self propertyName];
      }
      id result = 0;
      break;
  }
  return result;
}

- (char)propertyType
{
  return self->_propertyType;
}

uint64_t __38__SCNMaterialProperty_setBorderColor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialBorderColor:*(void *)(a1 + 40)];
}

- (void)_updateMaterialBorderColor:(id)a3
{
  BOOL v4 = [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:a3 != 0];
  if (v4)
  {
    uint64_t TextureSampler = C3DEffectSlotGetTextureSampler((uint64_t)v4);
    if (TextureSampler)
    {
      uint64_t v6 = TextureSampler;
      uint64_t v8 = C3DColor4FromRGBCFColor(a3, 0);
      C3DTextureSamplerSetBorderColor(v6, v8, v7);
    }
  }
}

+ (id)copyImageFromC3DImage:(__C3DImage *)a3
{
  if (C3DImageHasTextureRawData((uint64_t)a3)) {
    return 0;
  }
  uint64_t SharedInstance = C3DResourceCacheGetSharedInstance();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__SCNMaterialProperty_copyImageFromC3DImage___block_invoke;
  v9[3] = &unk_264009100;
  v9[4] = a1;
  v9[5] = a3;
  int v5 = (void *)C3DResourceCacheCopySourceForResource(SharedInstance, a3, 1, (uint64_t)v9);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6B0]), "initWithContentsOfFile:", objc_msgSend(v5, "path"));
    CFRelease(v5);
    return v7;
  }
  return v5;
}

uint64_t __70__SCNMaterialProperty_copyC3DImageFromImage_textureOptions_wasCached___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) _createC3DImageFromImage:*(void *)(a1 + 40)];
}

+ (__C3DImage)_createC3DImageFromImage:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = (void *)[NSURL URLWithString:a3];
    if ([v4 scheme])
    {
      id v5 = v4;
LABEL_6:
      return (__C3DImage *)C3DImageCreateWithURL(v5);
    }
    return (__C3DImage *)C3DImageCreateWithName((__CFString *)a3);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = a3;
      goto LABEL_6;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      return (__C3DImage *)C3DImageCreateWithData(a3);
    }
    else
    {
      CFTypeID v7 = CFGetTypeID(a3);
      if (v7 == CGImageGetTypeID())
      {
        return (__C3DImage *)C3DImageCreateWithCGImage((CGImage *)a3);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          return (__C3DImage *)C3DImageCreateWithClientImage(a3);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            return (__C3DImage *)C3DImageCreateWithMDLTexture(a3);
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
}

- (void)setContents:(id)contents
{
  if ([(SCNMaterialProperty *)self contents] == contents) {
    return;
  }

  self->_runtimeResolvedPath = 0;
  id v5 = (SCNMaterialAttachment *)scn_NSColorFromCGColorIfApplicable(contents);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCNMaterialProperty *)self setColor:v5];
    return;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SCNMaterialProperty *)self setLayer:v5];
    return;
  }
  if (NSClassFromString(&cfstr_Skscene.isa))
  {
    NSClassFromString(&cfstr_Skscene.isa);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SCNMaterialProperty *)self setSkScene:v5];
      return;
    }
  }
  if (NSClassFromString(&cfstr_Sktexture.isa))
  {
    NSClassFromString(&cfstr_Sktexture.isa);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SCNMaterialProperty *)self setSkTexture:v5];
      return;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = self;
    CFTypeID v7 = v5;
LABEL_31:
    [(SCNMaterialProperty *)v6 setAttachment:v7];
    return;
  }
  NSClassFromString(&cfstr_Glktextureinfo.isa);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFTypeID v7 = +[SCNMaterialAttachment materialAttachmentWithGLKTextureInfo:v5];
    uint64_t v6 = self;
    goto LABEL_31;
  }
  if ([(SCNMaterialAttachment *)v5 conformsToProtocol:&unk_26C0078D8])
  {
    [(SCNMaterialProperty *)self setMtlTexture:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(SCNMaterialProperty *)self setUIView:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SCNMaterialProperty *)self setUIWindow:v5];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(SCNMaterialProperty *)self setFloatValue:v5];
        }
        else
        {
          NSClassFromString(&cfstr_Avplayer.isa);
          if (objc_opt_isKindOfClass())
          {
            [(SCNMaterialProperty *)self setAvPlayer:v5];
          }
          else
          {
            NSClassFromString(&cfstr_Avcapturedevic.isa);
            if (objc_opt_isKindOfClass())
            {
              [(SCNMaterialProperty *)self setCaptureDevice:v5];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(SCNMaterialProperty *)self setCaptureDeviceOutputConsumerSource:v5];
              }
              else if ([(SCNMaterialAttachment *)v5 conformsToProtocol:&unk_26C0092F8])
              {
                [(SCNMaterialProperty *)self setTextureProvider:v5];
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
LABEL_10:
                  [(SCNMaterialProperty *)self setImage:v5];
                  return;
                }
                [(SCNMaterialProperty *)self setPrecomputedLightingEnvironment:v5];
              }
            }
          }
        }
      }
    }
  }
}

- (id)contents
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v6 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v7 = (uint64_t)v6;
    if (v6) {
      C3DSceneLock((uint64_t)v6);
    }
    uint64_t v8 = [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:0];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t ImageProxy = C3DEffectSlotGetImageProxy((uint64_t)v8);
      if (ImageProxy)
      {
        Source = (__C3DEffectSlot *)C3DImageProxyGetSource(ImageProxy);
      }
      else
      {
        uint64_t Image = C3DEffectSlotGetImage((uint64_t)v9);
        if (Image)
        {
          Source = (__C3DEffectSlot *)+[SCNMaterialProperty copyImageFromC3DImage:Image];
        }
        else
        {
          uint64_t ColorIfApplicable = C3DEffectSlotGetColorIfApplicable((uint64_t)v9);
          if (!ColorIfApplicable)
          {
            uint64_t v9 = 0;
            if (!v7) {
              return v9;
            }
            goto LABEL_20;
          }
          Source = (__C3DEffectSlot *)C3DColor4ToRGBCFColor(ColorIfApplicable);
        }
      }
      uint64_t v9 = Source;
    }
    if (!v7) {
      return v9;
    }
LABEL_20:
    C3DSceneUnlock(v7);
    return v9;
  }
  id contents = self->_contents;
  if ((!contents || self->_contentType != 1) && self->_c3dImage)
  {
    [(SCNMaterialProperty *)self image];
    id contents = self->_contents;
  }
  id v4 = contents;

  return v4;
}

- (void)copyPropertiesFrom:(id)a3
{
  if (*((void *)a3 + 16) && ([a3 contents], objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    -[SCNMaterialProperty _setImagePath:withResolvedPath:](self, "_setImagePath:withResolvedPath:", [a3 contents], *((void *)a3 + 16));
  }
  else {
    -[SCNMaterialProperty setContents:](self, "setContents:", [a3 contents]);
  }
  -[SCNMaterialProperty setMinificationFilter:](self, "setMinificationFilter:", [a3 minificationFilter]);
  -[SCNMaterialProperty setMagnificationFilter:](self, "setMagnificationFilter:", [a3 magnificationFilter]);
  -[SCNMaterialProperty setMipFilter:](self, "setMipFilter:", [a3 mipFilter]);
  [a3 contentsTransform];
  v5[0] = v5[4];
  v5[1] = v5[5];
  v5[2] = v5[6];
  v5[3] = v5[7];
  [(SCNMaterialProperty *)self setContentsTransform:v5];
  -[SCNMaterialProperty setWrapS:](self, "setWrapS:", [a3 wrapS]);
  -[SCNMaterialProperty setWrapT:](self, "setWrapT:", [a3 wrapT]);
  [a3 intensity];
  -[SCNMaterialProperty setIntensity:](self, "setIntensity:");
  -[SCNMaterialProperty setSRGBTexture:](self, "setSRGBTexture:", [a3 sRGBTexture]);
  -[SCNMaterialProperty setBorderColor:](self, "setBorderColor:", [a3 borderColor]);
  -[SCNMaterialProperty setMappingChannel:](self, "setMappingChannel:", [a3 mappingChannel]);
  -[SCNMaterialProperty setTextureComponents:](self, "setTextureComponents:", [a3 textureComponents]);
  [(SCNMaterialProperty *)self _copyAnimationsFrom:a3];
}

- (void)setMipFilter:(SCNFilterMode)mipFilter
{
  if (self->_mipFilter != mipFilter)
  {
    self->_int mipFilter = mipFilter;
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __36__SCNMaterialProperty_setMipFilter___block_invoke;
    v5[3] = &unk_264005010;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
  }
}

- (void)setMinificationFilter:(SCNFilterMode)minificationFilter
{
  if (self->_minificationFilter != minificationFilter)
  {
    self->_int minificationFilter = minificationFilter;
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __45__SCNMaterialProperty_setMinificationFilter___block_invoke;
    v5[3] = &unk_264005010;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
  }
}

- (void)setMappingChannel:(NSInteger)mappingChannel
{
  if (self->_mappingChannel != mappingChannel)
  {
    self->_mappingChannel = mappingChannel;
    id v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__SCNMaterialProperty_setMappingChannel___block_invoke;
    v6[3] = &unk_264004FC0;
    v6[4] = self;
    v6[5] = mappingChannel;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

- (void)setMagnificationFilter:(SCNFilterMode)magnificationFilter
{
  if (self->_magnificationFilter != magnificationFilter)
  {
    self->_int magnificationFilter = magnificationFilter;
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __46__SCNMaterialProperty_setMagnificationFilter___block_invoke;
    v5[3] = &unk_264005010;
    v5[4] = self;
    +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
  }
}

- (void)setContentsTransform:(SCNMatrix4 *)contentsTransform
{
  contentTransform = self->_contentTransform;
  if (!contentTransform) {
    goto LABEL_3;
  }
  long long v6 = *(_OWORD *)&contentsTransform->m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&contentsTransform->m11;
  *(_OWORD *)&a.m21 = v6;
  long long v7 = *(_OWORD *)&contentsTransform->m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&contentsTransform->m31;
  *(_OWORD *)&a.m41 = v7;
  long long v8 = *(_OWORD *)&contentTransform->m11;
  long long v9 = *(_OWORD *)&contentTransform->m21;
  long long v10 = *(_OWORD *)&contentTransform->m41;
  *(_OWORD *)&b.m31 = *(_OWORD *)&contentTransform->m31;
  *(_OWORD *)&b.m41 = v10;
  *(_OWORD *)&b.m11 = v8;
  *(_OWORD *)&b.m21 = v9;
  if (!SCNMatrix4EqualToMatrix4(&a, &b))
  {
LABEL_3:
    if (*((unsigned char *)self + 8))
    {
      uint64_t v14 = scn_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SCNMaterialProperty setContentsTransform:]((uint64_t)self, v14);
      }
    }
    else
    {
      long long v11 = *(_OWORD *)&contentsTransform->m21;
      *(_OWORD *)&a.m11 = *(_OWORD *)&contentsTransform->m11;
      *(_OWORD *)&a.m21 = v11;
      long long v12 = *(_OWORD *)&contentsTransform->m41;
      *(_OWORD *)&a.m31 = *(_OWORD *)&contentsTransform->m31;
      *(_OWORD *)&a.m41 = v12;
      if (SCNMatrix4IsIdentity(&a))
      {
        uint64_t v13 = self->_contentTransform;
        if (!v13) {
          return;
        }
        free(v13);
        self->_contentTransform = 0;
      }
      else
      {
        [(SCNMaterialProperty *)self __allocateContentTransformIfNeeded];
        v15 = self->_contentTransform;
        long long v16 = *(_OWORD *)&contentsTransform->m11;
        long long v17 = *(_OWORD *)&contentsTransform->m21;
        long long v18 = *(_OWORD *)&contentsTransform->m41;
        *(_OWORD *)&v15->m31 = *(_OWORD *)&contentsTransform->m31;
        *(_OWORD *)&v15->m41 = v18;
        *(_OWORD *)&v15->m11 = v16;
        *(_OWORD *)&v15->m21 = v17;
      }
      memset(&a, 0, sizeof(a));
      v19 = [(SCNMaterialProperty *)self sceneRef];
      id v20 = [(SCNMaterialProperty *)self _animationPathForKey:@"contentsTransform"];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __44__SCNMaterialProperty_setContentsTransform___block_invoke;
      v21[3] = &unk_2640087D0;
      v23 = self;
      SCNMatrix4 v22 = a;
      +[SCNTransaction postCommandWithContext:v19 object:self keyPath:v20 applyBlock:v21];
    }
  }
}

uint64_t __36__SCNMaterialProperty_setMipFilter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialFilters];
}

- (SCNWrapMode)wrapT
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    long long v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      SCNWrapMode WrapModeT = (int)C3DTextureSamplerGetWrapModeT((uint64_t)v6);
      if (!v5) {
        return WrapModeT;
      }
    }
    else
    {
      SCNWrapMode WrapModeT = SCNWrapModeClamp;
      if (!v5) {
        return WrapModeT;
      }
    }
    C3DSceneUnlock(v5);
    return WrapModeT;
  }
  return (unint64_t)self->_wrapT;
}

- (SCNWrapMode)wrapS
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    long long v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      SCNWrapMode WrapModeS = (int)C3DTextureSamplerGetWrapModeS((uint64_t)v6);
      if (!v5) {
        return WrapModeS;
      }
    }
    else
    {
      SCNWrapMode WrapModeS = SCNWrapModeClamp;
      if (!v5) {
        return WrapModeS;
      }
    }
    C3DSceneUnlock(v5);
    return WrapModeS;
  }
  return (unint64_t)self->_wrapS;
}

- (SCNColorMask)textureComponents
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    long long v6 = [(SCNMaterialProperty *)self effectSlot];
    if (v6)
    {
      SCNColorMask TextureComponents = C3DEffectSlotGetTextureComponents((uint64_t)v6);
      if (!v5) {
        return TextureComponents;
      }
    }
    else
    {
      SCNColorMask TextureComponents = 15;
      if (!v5) {
        return TextureComponents;
      }
    }
    C3DSceneUnlock(v5);
    return TextureComponents;
  }
  return self->_textureComponents;
}

- (void)setSRGBTexture:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 8);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 8) = v3 & 0xFB | v6;
    long long v7 = [(SCNMaterialProperty *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCNMaterialProperty_setSRGBTexture___block_invoke;
    v8[3] = &unk_264004FE8;
    v8[4] = self;
    BOOL v9 = a3;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v8];
  }
}

- (void)setBorderColor:(id)borderColor
{
  char v3 = self->_borderColor;
  if (v3 != borderColor)
  {

    self->_borderColor = (UIColor *)borderColor;
    char v6 = [(SCNMaterialProperty *)self sceneRef];
    id v7 = [(SCNMaterialProperty *)self _animationPathForKey:@"borderColor"];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SCNMaterialProperty_setBorderColor___block_invoke;
    v8[3] = &unk_264006160;
    v8[4] = self;
    void v8[5] = borderColor;
    +[SCNTransaction postCommandWithContext:v6 object:self keyPath:v7 applyBlock:v8];
  }
}

- (BOOL)sRGBTexture
{
  unsigned int v2 = *((unsigned __int8 *)self + 8);
  if (v2)
  {
    char v3 = self;
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    LOBYTE(v3) = C3DEffectSlotGetSRGB((uint64_t)[(SCNMaterialProperty *)v3 effectSlot]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    LODWORD(v3) = (v2 >> 2) & 1;
  }
  return (char)v3;
}

- (SCNFilterMode)mipFilter
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    char v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      SCNFilterMode MipFilter = (int)C3DTextureSamplerGetMipFilter((uint64_t)v6);
      if (!v5) {
        return MipFilter;
      }
    }
    else
    {
      SCNFilterMode MipFilter = SCNFilterModeNone;
      if (!v5) {
        return MipFilter;
      }
    }
    C3DSceneUnlock(v5);
    return MipFilter;
  }
  return (unint64_t)self->_mipFilter;
}

- (SCNFilterMode)minificationFilter
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    char v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      SCNFilterMode MinFilter = (int)C3DTextureSamplerGetMinFilter((uint64_t)v6);
      if (!v5) {
        return MinFilter;
      }
    }
    else
    {
      SCNFilterMode MinFilter = SCNFilterModeNone;
      if (!v5) {
        return MinFilter;
      }
    }
    C3DSceneUnlock(v5);
    return MinFilter;
  }
  return (unint64_t)self->_minificationFilter;
}

- (NSInteger)mappingChannel
{
  if ((*((unsigned char *)self + 8) & 1) == 0) {
    return self->_mappingChannel;
  }
  id v4 = [(SCNMaterialProperty *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    NSInteger v6 = [(SCNMaterialProperty *)self _presentationMappingChannel];
    C3DSceneUnlock(v5);
    return v6;
  }
  else
  {
    return [(SCNMaterialProperty *)self _presentationMappingChannel];
  }
}

- (SCNFilterMode)magnificationFilter
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    NSInteger v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      SCNFilterMode MagFilter = (int)C3DTextureSamplerGetMagFilter((uint64_t)v6);
      if (!v5) {
        return MagFilter;
      }
    }
    else
    {
      SCNFilterMode MagFilter = SCNFilterModeNone;
      if (!v5) {
        return MagFilter;
      }
    }
    C3DSceneUnlock(v5);
    return MagFilter;
  }
  return (unint64_t)self->_magnificationFilter;
}

- (CGFloat)intensity
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    NSInteger v6 = [(SCNMaterialProperty *)self effectSlot];
    if (v6)
    {
      double Intensity = C3DEffectSlotGetIntensity((uint64_t)v6);
      if (!v5) {
        return Intensity;
      }
    }
    else
    {
      double Intensity = 0.0;
      if (!v5) {
        return Intensity;
      }
    }
    C3DSceneUnlock(v5);
    return Intensity;
  }
  return self->_intensity;
}

- (SCNMatrix4)contentsTransform
{
  char v3 = self;
  *retstr = SCNMatrix4Identity;
  if ((LOBYTE(self->m13) & 1) == 0)
  {
    uint64_t v5 = *(long long **)&self[1].m43;
    if (v5)
    {
      long long v6 = *v5;
      long long v7 = v5[1];
      long long v8 = v5[3];
      *(_OWORD *)&retstr->m31 = v5[2];
      *(_OWORD *)&retstr->m41 = v8;
      *(_OWORD *)&retstr->m11 = v6;
      *(_OWORD *)&retstr->m21 = v7;
    }
    return self;
  }
  uint64_t v9 = [(SCNMatrix4 *)self sceneRef];
  uint64_t v10 = v9;
  if (v9) {
    C3DSceneLock(v9);
  }
  self = (SCNMatrix4 *)[(SCNMatrix4 *)v3 effectSlot];
  if (self)
  {
    self = (SCNMatrix4 *)C3DEffectSlotGetImageTransform((uint64_t)self);
    if (!self)
    {
      *retstr = SCNMatrix4Identity;
      if (!v10) {
        return self;
      }
      goto LABEL_10;
    }
    C3DMatrix4x4ToSCNMatrix4((uint64_t)self, retstr);
  }
  if (!v10) {
    return self;
  }
LABEL_10:

  return (SCNMatrix4 *)C3DSceneUnlock(v10);
}

- (id)borderColor
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    long long v6 = [(SCNMaterialProperty *)self textureSampler];
    if (v6)
    {
      char v3 = objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", C3DTextureSamplerGetBorderColor((uint64_t)v6));
      if (!v5) {
        return v3;
      }
    }
    else
    {
      char v3 = 0;
      if (!v5) {
        return v3;
      }
    }
    C3DSceneUnlock(v5);
    return v3;
  }
  return self->_borderColor;
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
        long long v11 = objc_msgSend((id)objc_msgSend(a3, "animationPlayerForKey:", v10), "copy");
        [(SCNMaterialProperty *)self addAnimationPlayer:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSArray)animationKeys
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  id v4 = [(SCNOrderedDictionary *)self->_animations allKeys];
  os_unfair_lock_unlock(p_animationsLock);
  if ([(NSArray *)v4 count]) {
    return v4;
  }
  else {
    return (NSArray *)MEMORY[0x263EFFA68];
  }
}

- (void)_updateMaterialImage:(id)a3
{
  -[SCNMaterialProperty _setC3DImageRef:](self, "_setC3DImageRef:");
  uint64_t v5 = [(SCNMaterialProperty *)self effectSlot];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    C3DEffectSlotSetImage((uint64_t)v5, a3);
    C3DEffectSlotSetImageProxy(v6, 0);
    C3DEffectSlotSetTexture(v6, 0);
    C3DEffectSlotSetMTLTexture(v6, 0);
    if (!a3)
    {
      C3DEffectSlotSetHasNoContents(v6);
    }
  }
}

- (void)_updateMaterialColor:(id)a3
{
  if (!a3)
  {
    uint64_t v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      _C3DCGColorGetComponentsInColorSpace_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  long long v13 = [(SCNMaterialProperty *)self effectSlot];
  if (v13)
  {
    uint64_t v14 = (uint64_t)v13;
    unsigned int EffectProperty = C3DEffectSlotGetEffectProperty((uint64_t)v13);
    uint64_t IsRawFloatValue = C3DEffectPropertyGetSemanticForColorIsRawFloatValue(EffectProperty);
    v18[0] = C3DColor4FromRGBCFColor(a3, IsRawFloatValue);
    v18[1] = v17;
    if (a3)
    {
      C3DEffectSlotSetImage(v14, 0);
      C3DEffectSlotSetImageProxy(v14, 0);
      C3DEffectSlotSetTexture(v14, 0);
    }
    C3DEffectSlotSetColor(v14, (float *)v18);
  }
}

- (void)_updateMaterialNumber:(id)a3
{
  if (a3)
  {
    uint64_t v5 = [(SCNMaterialProperty *)self effectSlot];
    if (!v5) {
      return;
    }
    uint64_t v6 = v5;
    C3DEffectSlotSetImage((uint64_t)v5, 0);
    C3DEffectSlotSetImageProxy((uint64_t)v6, 0);
    C3DEffectSlotSetTexture((uint64_t)v6, 0);
    goto LABEL_7;
  }
  uint64_t v7 = scn_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
    __RemoveVRAMResourceFromDic_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  uint64_t v6 = [(SCNMaterialProperty *)self effectSlot];
  if (v6)
  {
LABEL_7:
    [a3 floatValue];
    int32x2_t v22 = v15;
    if (C3DEffectSlotGetEffectProperty((uint64_t)v6) == 5)
    {
      int32x4_t v16 = vdupq_lane_s32(v22, 0);
    }
    else
    {
      __asm { FMOV            V0.4S, #1.0 }
      _Q0.i32[0] = v22.i32[0];
      int32x4_t v16 = vzip1q_s32(_Q0, _Q0);
      v16.i32[2] = v22.i32[0];
    }
    int32x4_t v23 = v16;
    C3DEffectSlotSetColor((uint64_t)v6, (float *)v23.i32);
  }
}

- (void)setPrecomputedLightingEnvironment:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 14;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__SCNMaterialProperty_setPrecomputedLightingEnvironment___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

+ (id)precomputedLightingEnvironmentContentsWithURL:(id)a3 error:(id *)a4
{
  uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:1 error:a4];

  return (id)[a1 precomputedLightingEnvironmentContentsWithData:v6 error:a4];
}

+ (id)precomputedLightingEnvironmentContentsWithData:(id)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = (void *)MEMORY[0x263F08928];
  uint64_t v7 = objc_opt_class();

  return (id)[v6 unarchivedObjectOfClass:v7 fromData:a3 error:a4];
}

- (SCNMaterialProperty)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNMaterialProperty;
  unsigned int v2 = [(SCNMaterialProperty *)&v5 init];
  char v3 = v2;
  if (v2)
  {
    v2->_parent = 0;
    v2->_int propertyType = 27;
    *((unsigned char *)v2 + 8) &= ~2u;
    v2->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
    v3->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNMaterialProperty *)v3 _syncObjCModel];
  }
  return v3;
}

+ (SCNMaterialProperty)materialPropertyWithContents:(id)contents
{
  id v4 = (SCNMaterialProperty *)(id)[objc_alloc((Class)a1) initWithParent:0 propertyType:27];
  [(SCNMaterialProperty *)v4 setContents:contents];
  return v4;
}

- (SCNMaterialProperty)initWithParent:(id)a3 andCustomName:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SCNMaterialProperty;
  uint64_t v6 = [(SCNMaterialProperty *)&v10 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (v6 == a3) {
      id v8 = 0;
    }
    else {
      id v8 = a3;
    }
    v6->_parent = v8;
    v6->_int propertyType = 27;
    v6->_customSlotName = (NSString *)[a4 copy];
    *((unsigned char *)v7 + 8) &= ~2u;
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNMaterialProperty *)v7 _syncObjCModel];
    [(SCNMaterialProperty *)v7 _syncObjCAnimations];
  }
  return v7;
}

- (id)initPresentationMaterialPropertyWithModelProperty:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNMaterialProperty;
  id v4 = [(SCNMaterialProperty *)&v9 init];
  if (v4)
  {
    if ((SCNMaterialProperty *)[a3 parent] == v4) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [a3 parent];
    }
    v4->_parent = (id)v5;
    int v6 = [a3 propertyType];
    v4->_int propertyType = v6;
    if (v6 >= 21) {
      char v7 = 1;
    }
    else {
      char v7 = 3;
    }
    *((unsigned char *)v4 + 8) = v7 | *((unsigned char *)v4 + 8) & 0xFC;
    v4->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (void)__allocateContentTransformIfNeeded
{
  if (!self->_contentTransform)
  {
    char v3 = (SCNMatrix4 *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
    self->_contentTransform = v3;
    SCNMatrix4 *v3 = SCNMatrix4Identity;
  }
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);

  self->_runtimeResolvedPath = 0;
  [(SCNMaterialProperty *)self _clearContents];

  free(self->_contentTransform);
  v3.receiver = self;
  v3.super_class = (Class)SCNMaterialProperty;
  [(SCNMaterialProperty *)&v3 dealloc];
}

- (id)__runtimeResolvedPath
{
  return self->_runtimeResolvedPath;
}

- (void)_setParent:(id)a3
{
  self->_parent = a3;
}

- (void)unlinkCustomPropertyWithParent:(id)a3
{
  self->_customSlot[1].var0.var1 = 0;
  [(SCNMaterialProperty *)self _setParent:0];
}

- (void)linkCustomPropertyWithParent:(id)a3 andCustomName:(id)a4
{
  if (a3 == self) {
    id v7 = 0;
  }
  else {
    id v7 = a3;
  }
  self->_parent = v7;

  id v8 = (NSString *)[a4 copy];
  self->_customSlotName = v8;
  self->_int propertyType = 27;
  *((unsigned char *)self + 8) &= ~2u;
  if (v8 && !self->_customSlot) {
    self->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
  }
  if ((SCNMaterialProperty *)objc_msgSend(a3, "__CFObject") == self) {
    unint64_t v9 = 0;
  }
  else {
    unint64_t v9 = objc_msgSend(a3, "__CFObject");
  }
  self->_customSlot[1].var0.var1 = v9;
}

uint64_t __37__SCNMaterialProperty__clearContents__block_invoke(uint64_t a1)
{
  id v2 = +[SCNSourceRendererRegistry sharedRegistry];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);

  return [v2 removeSourceRenderersForSource:v3];
}

- (id)color
{
  if (*((unsigned char *)self + 8))
  {
    id v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    int v6 = [(SCNMaterialProperty *)self effectSlot];
    if (v6 && (uint64_t ColorIfApplicable = C3DEffectSlotGetColorIfApplicable((uint64_t)v6)) != 0)
    {
      uint64_t v3 = objc_msgSend(MEMORY[0x263F1C550], "scn_colorWithC3DColor:", ColorIfApplicable);
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
  if (self->_contentType) {
    return 0;
  }
  id v9 = self->_contents;

  return v9;
}

- (id)floatValue
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v6 = (uint64_t)v5;
    if (v5) {
      C3DSceneLock((uint64_t)v5);
    }
    id v7 = [(SCNMaterialProperty *)self effectSlot];
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t ColorIfApplicable = (char *)C3DEffectSlotGetColorIfApplicable((uint64_t)v7);
      if (ColorIfApplicable)
      {
        int EffectProperty = C3DEffectSlotGetEffectProperty(v8);
        uint64_t v12 = 12;
        if (EffectProperty != 5) {
          uint64_t v12 = 0;
        }
        LODWORD(v11) = *(_DWORD *)&ColorIfApplicable[v12];
        uint64_t ColorIfApplicable = (char *)[NSNumber numberWithFloat:v11];
      }
      if (!v6) {
        return ColorIfApplicable;
      }
    }
    else
    {
      uint64_t ColorIfApplicable = 0;
      if (!v6) {
        return ColorIfApplicable;
      }
    }
    C3DSceneUnlock(v6);
    return ColorIfApplicable;
  }
  if (self->_contentType != 9) {
    return 0;
  }
  id v3 = self->_contents;

  return v3;
}

- (void)getC3DImageRef
{
  return self->_c3dImage;
}

- (C3DColor4)color4
{
  char v11 = 0;
  uint64_t v2 = objc_msgSend((id)scn_NSColorFromCGColorIfApplicable(-[SCNMaterialProperty color](self, "color")), "scn_C3DColorIgnoringColorSpace:success:", 0, &v11);
  if (v11) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v11) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = 0;
  }
  if (v11) {
    uint64_t v7 = HIDWORD(v2);
  }
  else {
    uint64_t v7 = 0;
  }
  if (v11) {
    uint64_t v8 = v2;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v5 | (v6 << 32);
  uint64_t v10 = v8 | (v7 << 32);
  *(void *)&result.var0.var1.var2 = v9;
  *(void *)result.var0.var0 = v10;
  return result;
}

uint64_t __45__SCNMaterialProperty_setMinificationFilter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialFilters];
}

uint64_t __46__SCNMaterialProperty_setMagnificationFilter___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialFilters];
}

void __38__SCNMaterialProperty_setSRGBTexture___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) effectSlot])
  {
    uint64_t v2 = [*(id *)(a1 + 32) effectSlot];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    C3DEffectSlotSetSRGB(v2, v3);
  }
}

- (void)setAttachment:(id)a3
{
  id contents = self->_contents;
  if (contents != a3 && (objc_msgSend(contents, "isEqual:") & 1) == 0)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 7;
    uint64_t v6 = [(SCNMaterialProperty *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNMaterialProperty_setAttachment___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

uint64_t __37__SCNMaterialProperty_setAttachment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialAttachment:*(void *)(a1 + 40)];
}

- (id)attachment
{
  if (self->_contentType == 7) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (id)image
{
  if (self->_c3dImage && (self->_contentType != 1 || !self->_contents))
  {
    id v3 = +[SCNMaterialProperty copyImageFromC3DImage:](SCNMaterialProperty, "copyImageFromC3DImage:");
    if (v3)
    {
      unsigned int v4 = v3;
      if ((self->_contentType & 0xFE) == 2)
      {
        uint64_t v5 = scn_default_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          [(SCNMaterialProperty *)v5 image];
        }
      }

      self->_id contents = v4;
      self->_unsigned int contentType = 1;
    }
  }
  if (self->_contentType == 1) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (id)pvrtcData
{
  id v3 = [(SCNMaterialProperty *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  c3duint64_t Image = self->_c3dImage;
  if (c3dImage && C3DImageGetTextureRawDataCompression((uint64_t)c3dImage) == 1)
  {
    DatSCNMatrix4 a = (void *)C3DImageGetData((uint64_t)self->_c3dImage);
    if (!v4) {
      return Data;
    }
    goto LABEL_8;
  }
  DatSCNMatrix4 a = 0;
  if (v4) {
LABEL_8:
  }
    C3DSceneUnlock(v4);
  return Data;
}

- (void)setSkScene:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 3;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__SCNMaterialProperty_setSkScene___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __34__SCNMaterialProperty_setSkScene___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialSKScene:*(void *)(a1 + 40)];
}

- (id)skScene
{
  if (self->_contentType == 3) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setSkTexture:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 4;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __36__SCNMaterialProperty_setSkTexture___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __36__SCNMaterialProperty_setSkTexture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialSKTexture:*(void *)(a1 + 40)];
}

- (id)skTexture
{
  if (self->_contentType == 4) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setLayer:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 2;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__SCNMaterialProperty_setLayer___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __32__SCNMaterialProperty_setLayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialLayer:*(void *)(a1 + 40)];
}

- (id)layer
{
  if (self->_contentType == 2) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setAvPlayer:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 10;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterialProperty_setAvPlayer___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __35__SCNMaterialProperty_setAvPlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialAVPlayer:*(void *)(a1 + 40)];
}

- (id)avPlayer
{
  if (self->_contentType == 10) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDevice:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 11;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SCNMaterialProperty_setCaptureDevice___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __40__SCNMaterialProperty_setCaptureDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialCaptureDevice:*(void *)(a1 + 40)];
}

- (id)captureDevice
{
  if (self->_contentType == 11) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setCaptureDeviceOutputConsumerSource:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 12;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__SCNMaterialProperty_setCaptureDeviceOutputConsumerSource___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __60__SCNMaterialProperty_setCaptureDeviceOutputConsumerSource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialCaptureDeviceOutputConsumerSource:*(void *)(a1 + 40)];
}

- (id)captureDeviceOutputConsumerSource
{
  if (self->_contentType == 12) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setTextureProvider:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 13;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__SCNMaterialProperty_setTextureProvider___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __42__SCNMaterialProperty_setTextureProvider___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialTextureProvider:*(void *)(a1 + 40)];
}

- (id)textureProvider
{
  if (self->_contentType == 13) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (id)precomputedLightingEnvironment
{
  if (self->_contentType == 14) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)_updateMaterialUIComponent:(id)a3
{
  uint64_t v5 = [(SCNMaterialProperty *)self effectSlot];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if (a3)
    {
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __50__SCNMaterialProperty__updateMaterialUIComponent___block_invoke;
      v8[3] = &unk_264009088;
      v8[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v8);
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__layerDidChange_, @"SCNUITreeDidChange", C3DImageProxyGetSource((uint64_t)IfNeededForSource));
      C3DEffectSlotSetImageProxy(v6, IfNeededForSource);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SCNUITreeDidChange", 0);
      C3DEffectSlotSetImageProxy(v6, 0);
    }
  }
}

uint64_t __50__SCNMaterialProperty__updateMaterialUIComponent___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(0);
  id v3 = objc_alloc_init(SCNUIKitSource);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v5 = *(void *)(a1 + 32);
  if (isKindOfClass) {
    [(SCNUIKitSource *)v3 setUiView:v5];
  }
  else {
    [(SCNUIKitSource *)v3 setUiWindow:v5];
  }
  [(SCNImageSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)setUIView:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 8;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __33__SCNMaterialProperty_setUIView___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __33__SCNMaterialProperty_setUIView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialUIComponent:*(void *)(a1 + 40)];
}

- (id)UIView
{
  if (self->_contentType == 8) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setUIWindow:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 8;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__SCNMaterialProperty_setUIWindow___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __35__SCNMaterialProperty_setUIWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialUIComponent:*(void *)(a1 + 40)];
}

+ (id)dvt_supportedTypesForPropertyContents
{
  v3[14] = *MEMORY[0x263EF8340];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = NSClassFromString(&cfstr_Skscene.isa);
  v3[7] = NSClassFromString(&cfstr_Glktextureinfo.isa);
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = NSClassFromString(&cfstr_Avplayer.isa);
  v3[11] = NSClassFromString(&cfstr_Avcapturedevic.isa);
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  return (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v3 count:14];
}

- (void)_setImagePath:(id)a3 withResolvedPath:(id)a4
{
  [(SCNMaterialProperty *)self _updateC3DImageWithContents:a4];
  [(SCNMaterialProperty *)self _clearContents];
  self->_id contents = a3;
  self->_unsigned int contentType = 1;
  id runtimeResolvedPath = self->_runtimeResolvedPath;
  if (runtimeResolvedPath != a4)
  {

    self->_id runtimeResolvedPath = a4;
  }
}

- (CGFloat)maxAnisotropy
{
  if (*((unsigned char *)self + 8))
  {
    uint64_t v4 = [(SCNMaterialProperty *)self sceneRef];
    uint64_t v5 = (uint64_t)v4;
    if (v4) {
      C3DSceneLock((uint64_t)v4);
    }
    float Anisotropy = C3DTextureSamplerGetAnisotropy((uint64_t)[(SCNMaterialProperty *)self textureSampler]);
    if (v5) {
      C3DSceneUnlock(v5);
    }
  }
  else
  {
    return self->_maxAnisotropy;
  }
  return Anisotropy;
}

- (void)setMaxAnisotropy:(CGFloat)maxAnisotropy
{
  float v3 = maxAnisotropy;
  if (self->_maxAnisotropy != v3)
  {
    self->_maxfloat Anisotropy = v3;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __40__SCNMaterialProperty_setMaxAnisotropy___block_invoke;
    v6[3] = &unk_264009038;
    v6[4] = self;
    float v7 = v3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

int8x8_t __40__SCNMaterialProperty_setMaxAnisotropy___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) textureSampler];
  if (v2)
  {
    float v4 = *(float *)(a1 + 40);
    return C3DTextureSamplerSetAnisotropy(v2, v4);
  }
  return result;
}

- (void)setProceduralContents:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 6;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__SCNMaterialProperty_setProceduralContents___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    void v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __45__SCNMaterialProperty_setProceduralContents___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialProceduralContents:*(void *)(a1 + 40)];
}

- (id)proceduralContents
{
  if (self->_contentType == 6) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

- (void)setMtlTexture:(id)a3
{
  if (self->_contents != a3)
  {
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = a3;
    self->_unsigned int contentType = 5;
    uint64_t v5 = [(SCNMaterialProperty *)self sceneRef];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __37__SCNMaterialProperty_setMtlTexture___block_invoke;
    v6[3] = &unk_264006160;
    v6[4] = self;
    void v6[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
  }
}

uint64_t __37__SCNMaterialProperty_setMtlTexture___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaterialMTLTexture:*(void *)(a1 + 40)];
}

- (id)mtlTexture
{
  if (self->_contentType == 5) {
    return self->_contents;
  }
  else {
    return 0;
  }
}

uint64_t __44__SCNMaterialProperty_setContentsTransform___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 96);
  long long v2 = *(_OWORD *)(a1 + 48);
  v5[0] = *(_OWORD *)(a1 + 32);
  v5[1] = v2;
  long long v3 = *(_OWORD *)(a1 + 80);
  v5[2] = *(_OWORD *)(a1 + 64);
  v5[3] = v3;
  return [v1 _updateMaterialPropertyTransform:v5];
}

- (NSString)description
{
  id v3 = [(SCNMaterialProperty *)self contents];
  float v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = (id)objc_msgSend(NSString, "stringWithFormat:", @"<data %p>", v3);
  }
  return (NSString *)[v4 stringWithFormat:@"<%@: %p | contents=%@>", v6, self, v3];
}

uint64_t __70__SCNMaterialProperty_copyC3DImageFromImage_textureOptions_wasCached___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  long long v2 = *(uint64_t **)(a1 + 40);
  *(unsigned char *)(*(void *)(v1 + 8) + 24) = 1;
  return C3DImageCreateVerticalStripCubemapWithFaceImages(v2);
}

+ (__C3DImage)copyC3DImageFromImage:(id)a3
{
  return (__C3DImage *)[a1 copyC3DImageFromImage:a3 textureOptions:0 wasCached:0];
}

+ (id)_copyImageFromC3DImage:(__C3DImage *)a3
{
  id v3 = C3DImageCopyCGImage((uint64_t)a3);
  float v4 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v3];
  CGImageRelease(v3);
  return v4;
}

uint64_t __45__SCNMaterialProperty_copyImageFromC3DImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _copyImageFromC3DImage:*(void *)(a1 + 40)];
}

- (void)parentWillDie:(id)a3
{
  if (self->_parent != a3)
  {
    float v4 = scn_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      -[SCNMaterialProperty parentWillDie:](v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  self->_parent = 0;
}

- (id)parent
{
  return self->_parent;
}

- (__C3DTextureSampler)textureSampler
{
  int8x8_t result = [(SCNMaterialProperty *)self effectSlot];
  if (result)
  {
    return (__C3DTextureSampler *)C3DEffectSlotGetTextureSampler((uint64_t)result);
  }
  return result;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  return (id)[self->_parent copyAnimationChannelForKeyPath:a3 property:self];
}

- (__C3DAnimationManager)animationManager
{
  int8x8_t result = [(SCNMaterialProperty *)self sceneRef];
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
    uint64_t v9 = [(SCNMaterialProperty *)self __CFObject];
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
    BOOL v8 = [(SCNMaterialProperty *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__SCNMaterialProperty_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    void v10[5] = self;
    void v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __49__SCNMaterialProperty_addAnimationPlayer_forKey___block_invoke(id *a1)
{
  objc_msgSend(a1[4], "prepareWithTarget:implicitDuration:", a1[5]);
  if ((SCNAddAnimation(a1[4], a1[5], a1[6]) & 1) == 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 8);
    [*((id *)a1[5] + 5) removeObjectForKey:a1[6]];
    long long v2 = (os_unfair_lock_s *)((char *)a1[5] + 32);
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
    uint64_t v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNMaterialProperty *)self addAnimationPlayer:v7 forKey:v5];
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
  float v4 = [(SCNMaterialProperty *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __42__SCNMaterialProperty_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  _OWORD v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __42__SCNMaterialProperty_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  uint64_t v6 = [(SCNMaterialProperty *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SCNMaterialProperty_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&void v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __63__SCNMaterialProperty_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    uint64_t v6 = [(SCNMaterialProperty *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __45__SCNMaterialProperty_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __45__SCNMaterialProperty_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNMaterialProperty *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__SCNMaterialProperty_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&void v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __62__SCNMaterialProperty_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
{
}

- (id)animationForKey:(id)a3
{
  id v3 = [(SCNMaterialProperty *)self _scnAnimationForKey:a3];
  float v4 = (void *)MEMORY[0x263F15748];

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
  uint64_t v9 = [(SCNMaterialProperty *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNMaterialProperty *)self animationManager];
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
  BOOL v5 = [(SCNMaterialProperty *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMaterialProperty_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __44__SCNMaterialProperty_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNMaterialProperty *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SCNMaterialProperty_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __45__SCNMaterialProperty_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  BOOL v8 = [(SCNMaterialProperty *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__SCNMaterialProperty_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&void v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __48__SCNMaterialProperty_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMaterialProperty *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNMaterialProperty *)self __CFObject];
  if (v7)
  {
    BOOL v8 = v7;
    uint64_t v9 = [(SCNMaterialProperty *)self animationManager];
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

    uint64_t v15 = [(SCNMaterialProperty *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __71__SCNMaterialProperty_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __71__SCNMaterialProperty_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNMaterialProperty *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__SCNMaterialProperty_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  void v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __44__SCNMaterialProperty_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNMaterialProperty *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__SCNMaterialProperty_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __40__SCNMaterialProperty_removeAllBindings__block_invoke(uint64_t a1)
{
  uint64_t v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() materialPropertyWithContents:0];
  id v5 = v4;
  [v4 copyPropertiesFrom:self];
  return v4;
}

- (id)copy
{
  return [(SCNMaterialProperty *)self copyWithZone:0];
}

- (id)presentationMaterialProperty
{
  if ((*((unsigned char *)self + 8) & 1) == 0)
  {
    id v2 = [[SCNMaterialProperty alloc] initPresentationMaterialPropertyWithModelProperty:self];
    return v2;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)_updateMaterialPropertyTransform:(C3DMatrix4x4 *)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    C3DEffectSlotSetImageTransform((uint64_t)v4, (long long *)a3);
  }
}

- (void)_updateMaterialAttachment:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = scn_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[SCNMaterialProperty _updateMaterialAttachment:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
    unsigned int v13 = [a3 glID];
    int v14 = [a3 target];
    [a3 size];
    uint64_t v17 = 0;
    if (v13 && v14 && *(double *)&v15 > 0.0)
    {
      long long v23 = v15;
      float64_t v24 = v16;
      uint64_t v17 = C3DTextureCreate();
      C3DTextureSetID(v17, v13, v14);
      *(void *)&v18.f64[0] = v23;
      v18.f64[1] = v24;
      C3DTextureSetSize(v17, COERCE_DOUBLE(vcvt_f32_f64(v18)));
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", @"offsetX"), "floatValue");
      LODWORD(v24) = v19;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", @"offsetY"), "floatValue");
      C3DTextureSetOffset(v17, COERCE_DOUBLE(__PAIR64__(v20, LODWORD(v24))));
      C3DTextureSetHasAlpha(v17, 1);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  long long v21 = [(SCNMaterialProperty *)self effectSlot];
  if (v21)
  {
    if (v17) {
      int32x2_t v22 = (const void *)v17;
    }
    else {
      int32x2_t v22 = 0;
    }
    C3DEffectSlotSetTexture((uint64_t)v21, v22);
  }
}

- (void)_layerDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v5 = [(SCNMaterialProperty *)self sceneRef];

  [v4 postNotificationName:@"kC3DSceneDidUpdateNotification" object:v5];
}

- (void)_skSceneDidChange:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v5 = [(SCNMaterialProperty *)self sceneRef];

  [v4 postNotificationName:@"kC3DSceneDidUpdateNotification" object:v5];
}

- (void)_updateMaterialSKScene:(id)a3
{
  id v5 = [(SCNMaterialProperty *)self effectSlot];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if (a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__skSceneDidChange_, @"kC3DSceneDidUpdateNotification", a3);
      uint64_t v7 = (void *)[MEMORY[0x263F08D40] valueWithPointer:a3];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __46__SCNMaterialProperty__updateMaterialSKScene___block_invoke;
      v10[3] = &unk_264009088;
      v10[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(v7, (uint64_t)v10);
      C3DEffectSlotSetImageProxy(v6, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v5, 0);
      uint64_t v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v9 removeObserver:self name:@"kC3DSceneDidUpdateNotification" object:0];
    }
  }
}

uint64_t __46__SCNMaterialProperty__updateMaterialSKScene___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(0);
  CFStringRef v3 = objc_alloc_init(SCNSpriteKitSource);
  [(SCNSpriteKitSource *)v3 setScene:*(void *)(a1 + 32)];
  [(SCNImageSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)_updateMaterialMTLTexture:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    if (a3) {
      id v5 = a3;
    }
    else {
      id v5 = 0;
    }
    C3DEffectSlotSetMTLTexture((uint64_t)v4, v5);
  }
}

- (void)_updateMaterialSKTexture:(id)a3
{
  id v5 = [(SCNMaterialProperty *)self effectSlot];
  if (!v5) {
    return;
  }
  if (a3)
  {
    if (C3DMetalIsUsed())
    {
      uint64_t v6 = [a3 metalTexture];
      if (v6)
      {
        uint64_t v7 = (const void *)v6;
        uint64_t v8 = [(SCNMaterialProperty *)self effectSlot];
        uint64_t v9 = [(SCNMaterialProperty *)self commonProfile];
        if (v9) {
          C3DEffectCommonProfileSetMTLTexture((uint64_t)v9, self->_propertyType, v7);
        }
        else {
          C3DEffectSlotSetMTLTexture((uint64_t)v8, v7);
        }
        if ([a3 hasAlpha]) {
          __int16 v14 = 0;
        }
        else {
          __int16 v14 = 256;
        }
        *((_WORD *)v8 + 24) = *((_WORD *)v8 + 24) & 0xFEFF | v14;
      }
      goto LABEL_25;
    }
    [NSClassFromString(&cfstr_Skscnrenderer.isa) setPrefersOpenGL:1];
    unsigned int v10 = [a3 glTextureId];
    if (v10)
    {
      unsigned int v11 = v10;
      uint64_t v12 = (const void *)C3DTextureCreate();
      C3DTextureSetID((uint64_t)v12, v11, 3553);
      if ([a3 hasAlpha]) {
        C3DTextureSetHasAlpha((uint64_t)v12, 1);
      }
      C3DTextureSetFormat((uint64_t)v12, [a3 textureTarget]);
    }
    else
    {
      uint64_t v12 = 0;
    }
    unsigned int v13 = [(SCNMaterialProperty *)self effectSlot];
    if ([(SCNMaterialProperty *)self commonProfile])
    {
      C3DEffectCommonProfileSetTexture((uint64_t)[(SCNMaterialProperty *)self commonProfile], self->_propertyType, v12);
      if (!v12) {
        goto LABEL_25;
      }
    }
    else
    {
      C3DEffectSlotSetTexture((uint64_t)v13, v12);
      if (!v12)
      {
LABEL_25:
        [a3 textureRect];
        memset(&v21, 0, sizeof(v21));
        *(float *)&double v15 = v15;
        *(float *)&double v16 = v16;
        *(float *)&double v17 = v17;
        *(float *)&double v18 = v18;
        *(void *)&a.m14 = 0;
        *(void *)&a.m12 = 0;
        a.m11 = *(float *)&v17;
        a.m22 = *(float *)&v18;
        *(void *)&a.m23 = 0;
        *(void *)&a.m31 = 0;
        *(void *)&a.m42 = 0;
        *(void *)&a.m34 = 0;
        a.m33 = 1.0;
        a.m44 = 1.0;
        *(void *)&b.m14 = 0;
        *(void *)&b.m12 = 0;
        b.m11 = 1.0;
        b.m22 = 1.0;
        *(void *)&b.m23 = 0;
        *(void *)&b.m31 = 0;
        *(void *)&b.m33 = 1065353216;
        b.m41 = *(float *)&v15;
        b.m42 = *(float *)&v16;
        *(void *)&b.m43 = 0x3F80000000000000;
        SCNMatrix4Mult(&v21, &a, &b);
        *(void *)&b.m14 = 0;
        *(void *)&b.m12 = 0;
        b.m11 = 1.0;
        b.m22 = 1.0;
        *(void *)&b.m23 = 0;
        *(void *)&b.m31 = 0;
        *(_OWORD *)&b.m33 = xmmword_20B5EE240;
        *(void *)&b.m43 = 0x3F80000000000000;
        SCNMatrix4 v23 = v21;
        SCNMatrix4Mult(&a, &b, &v23);
        SCNMatrix4 v21 = a;
        if ([a3 isRotated])
        {
          memset(&a, 0, sizeof(a));
          SCNMatrix4MakeRotation(&a, -1.5708, 0.0, 0.0, 1.0);
          SCNMatrix4 v23 = a;
          SCNMatrix4 v22 = v21;
          SCNMatrix4Mult(&b, &v23, &v22);
          SCNMatrix4 v21 = b;
        }
        memset(&b.m22, 0, 40);
        *(_OWORD *)&b.m12 = 0u;
        b.m11 = 1.0;
        b.m22 = -1.0;
        b.m33 = 1.0;
        b.m44 = 1.0;
        SCNMatrix4 v23 = v21;
        SCNMatrix4Mult(&a, &b, &v23);
        SCNMatrix4 v21 = a;
        *(void *)&v23.m14 = 0;
        *(void *)&v23.m12 = 0;
        v23.m11 = 1.0;
        v23.m22 = 1.0;
        *(void *)&v23.m23 = 0;
        *(void *)&v23.m31 = 0;
        *(_OWORD *)&v23.m33 = xmmword_20B5EE250;
        *(void *)&v23.m43 = 0x3F80000000000000;
        SCNMatrix4 v22 = a;
        SCNMatrix4Mult(&a, &v23, &v22);
        SCNMatrix4 v21 = a;
        BOOL v19 = +[SCNTransaction immediateMode];
        if (!v19) {
          +[SCNTransaction setImmediateMode:1];
        }
        SCNMatrix4 a = v21;
        [(SCNMaterialProperty *)self setContentsTransform:&a];
        [(SCNMaterialProperty *)self setWrapS:1];
        [(SCNMaterialProperty *)self setWrapT:1];
        -[SCNMaterialProperty setMinificationFilter:](self, "setMinificationFilter:", 2 * ([a3 filteringMode] == 1));
        -[SCNMaterialProperty setMagnificationFilter:](self, "setMagnificationFilter:", 2 * ([a3 filteringMode] == 1));
        if ([a3 usesMipmaps]) {
          uint64_t v20 = 2;
        }
        else {
          uint64_t v20 = 0;
        }
        [(SCNMaterialProperty *)self setMipFilter:v20];
        if (!v19) {
          +[SCNTransaction setImmediateMode:0];
        }
        return;
      }
    }
    CFRelease(v12);
    goto LABEL_25;
  }

  C3DEffectSlotSetTexture((uint64_t)v5, 0);
}

- (void)_updateMaterialLayer:(id)a3
{
  id v5 = [(SCNMaterialProperty *)self effectSlot];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if (a3)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", self, sel__layerDidChange_, @"SCNLayerTreeDidChange", a3);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __44__SCNMaterialProperty__updateMaterialLayer___block_invoke;
      v9[3] = &unk_264009088;
      v9[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v9);
      C3DEffectSlotSetImageProxy(v6, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v5, 0);
      uint64_t v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v8 removeObserver:self name:@"SCNLayerTreeDidChange" object:0];
    }
  }
}

uint64_t __44__SCNMaterialProperty__updateMaterialLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(0);
  CFStringRef v3 = objc_alloc_init(SCNCoreAnimationSource);
  [(SCNCoreAnimationSource *)v3 setLayer:*(void *)(a1 + 32)];
  [(SCNImageSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)_updateMaterialAVPlayer:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    if (a3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __47__SCNMaterialProperty__updateMaterialAVPlayer___block_invoke;
      v7[3] = &unk_264009088;
      v7[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v7);
      C3DEffectSlotSetImageProxy(v5, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v4, 0);
    }
  }
}

uint64_t __47__SCNMaterialProperty__updateMaterialAVPlayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(1);
  CFStringRef v3 = objc_alloc_init(SCNAVPlayerSource);
  [(SCNAVPlayerSource *)v3 setPlayer:*(void *)(a1 + 32)];
  [(SCNAVPlayerSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)_updateMaterialCaptureDevice:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    if (a3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __52__SCNMaterialProperty__updateMaterialCaptureDevice___block_invoke;
      v7[3] = &unk_264009088;
      v7[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v7);
      C3DEffectSlotSetImageProxy(v5, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v4, 0);
    }
  }
}

uint64_t __52__SCNMaterialProperty__updateMaterialCaptureDevice___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(2);
  CFStringRef v3 = objc_alloc_init(SCNCaptureDeviceSource);
  [(SCNCaptureDeviceSource *)v3 setCaptureDevice:*(void *)(a1 + 32)];
  [(SCNCaptureDeviceSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)_updateMaterialCaptureDeviceOutputConsumerSource:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    if (a3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __72__SCNMaterialProperty__updateMaterialCaptureDeviceOutputConsumerSource___block_invoke;
      v7[3] = &unk_264009088;
      v7[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v7);
      C3DEffectSlotSetImageProxy(v5, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v4, 0);
    }
  }
}

uint64_t __72__SCNMaterialProperty__updateMaterialCaptureDeviceOutputConsumerSource___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(3);
  [*(id *)(a1 + 32) connectToProxy:v2];
  return v2;
}

- (void)_updateMaterialTextureProvider:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    if (a3)
    {
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __54__SCNMaterialProperty__updateMaterialTextureProvider___block_invoke;
      v7[3] = &unk_264009088;
      v7[4] = a3;
      IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v7);
      C3DEffectSlotSetImageProxy(v5, IfNeededForSource);
    }
    else
    {
      C3DEffectSlotSetImageProxy((uint64_t)v4, 0);
    }
  }
}

uint64_t __54__SCNMaterialProperty__updateMaterialTextureProvider___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(0);
  CFStringRef v3 = objc_alloc_init(SCNMaterialPropertyTextureProviderSource);
  [(SCNMaterialPropertyTextureProviderSource *)v3 setTextureProvider:*(void *)(a1 + 32)];
  [(SCNMaterialPropertyTextureProviderSource *)v3 connectToProxy:v2];

  return v2;
}

- (void)_updateMaterialProceduralContents:(id)a3
{
  uint64_t v4 = [(SCNMaterialProperty *)self effectSlot];
  uint64_t v5 = (uint64_t)v4;
  if (a3)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__SCNMaterialProperty__updateMaterialProceduralContents___block_invoke;
    v7[3] = &unk_264009088;
    v7[4] = a3;
    IfNeededForSource = SCNGetCachedImageProxyOrCreateIfNeededForSource(a3, (uint64_t)v7);
    C3DEffectSlotSetImageProxy(v5, IfNeededForSource);
  }
  else
  {
    C3DEffectSlotSetImageProxy((uint64_t)v4, 0);
  }
}

uint64_t __57__SCNMaterialProperty__updateMaterialProceduralContents___block_invoke(uint64_t a1)
{
  uint64_t v2 = C3DImageProxyCreate(0);
  CFStringRef v3 = objc_alloc_init(SCNDelegateSource);
  [(SCNDelegateSource *)v3 setDelegate:*(void *)(a1 + 32)];
  [(SCNImageSource *)v3 connectToProxy:v2];

  return v2;
}

+ (id)captureDeviceOutputConsumer
{
  return (id)[a1 captureDeviceOutputConsumerWithOptions:0];
}

+ (id)captureDeviceOutputConsumerWithOptions:(id)a3
{
  CFStringRef v3 = [[SCNCaptureDeviceOutputConsumerSource alloc] initWithOptions:a3];

  return v3;
}

- (void)_customEncodingOfSCNMaterialProperty:(id)a3
{
  contentTransform = self->_contentTransform;
  if (contentTransform)
  {
    long long v6 = *(_OWORD *)&contentTransform->m11;
    long long v7 = *(_OWORD *)&contentTransform->m21;
    long long v8 = *(_OWORD *)&contentTransform->m41;
    v14[2] = *(_OWORD *)&contentTransform->m31;
    v14[3] = v8;
    v14[0] = v6;
    v14[1] = v7;
    SCNEncodeSCNMatrix4(a3, (const char *)@"contentsTransform", (uint64_t)v14);
  }
  if (self->_contents)
  {
    if (self->_contentType == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        SCNEncodeImageArray(a3, @"imageArray", self->_contents);
        goto LABEL_14;
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "options"), "objectForKeyedSubscript:", @"SCNSceneExportEmbedImages"), "BOOLValue")|| (id contents = self->_runtimeResolvedPath) == 0)
    {
      id contents = self->_contents;
    }
    goto LABEL_13;
  }
  id contents = self->_contents;
  if (!contents)
  {
    c3duint64_t Image = self->_c3dImage;
    if (!c3dImage) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
  int contentType = self->_contentType;
  if (contentType == 1)
  {
LABEL_13:
    SCNEncodeImageContents(a3, @"image", contents);
    goto LABEL_14;
  }
  c3duint64_t Image = self->_c3dImage;
  if (c3dImage)
  {
LABEL_35:
    SCNEncodeC3DImage(a3, @"image", (uint64_t)c3dImage);
    goto LABEL_14;
  }
  if (!self->_contentType)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
    int contentType = self->_contentType;
  }
  if (contentType == 9)
  {
    [self->_contents floatValue];
    objc_msgSend(a3, "encodeFloat:forKey:", @"float");
    int contentType = self->_contentType;
  }
  if (contentType == 2)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, @"layer");
    int contentType = self->_contentType;
  }
  if (contentType == 3)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, @"skscene");
    int contentType = self->_contentType;
  }
  if (contentType == 4)
  {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)self->_contents, @"sktexture");
    int contentType = self->_contentType;
  }
  if (contentType == 5)
  {
    SCNEncodeMTLTextureAsDataForKey(a3, (uint64_t)self->_contents, @"data");
    int contentType = self->_contentType;
  }
  if (contentType == 14) {
    [a3 encodeObject:self->_contents forKey:@"precomputedLightingEnvironment"];
  }
LABEL_14:
  [a3 encodeInteger:self->_mappingChannel forKey:@"mappingChannel"];
  uint64_t textureComponents = self->_textureComponents;
  if (textureComponents != 15) {
    [a3 encodeInteger:textureComponents forKey:@"textureComponents"];
  }
  *(float *)&double v10 = self->_maxAnisotropy;
  [a3 encodeFloat:@"maxAnisotropy" forKey:v10];
  [a3 encodeInteger:self->_minificationFilter forKey:@"minificationFilter"];
  [a3 encodeInteger:self->_magnificationFilter forKey:@"magnificationFilter"];
  [a3 encodeInteger:self->_mipFilter forKey:@"mipFilter"];
  [a3 encodeInteger:self->_wrapS forKey:@"wrapS"];
  [a3 encodeInteger:self->_wrapT forKey:@"wrapT"];
}

- (void)_didDecodeSCNMaterialProperty:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  if (self->_customSlotName && !self->_customSlot) {
    self->_customSlot = (__C3DEffectSlot *)C3DEffectSlotCreate(0, 27);
  }
  id v5 = SCNDecodeImageContents(a3, @"image");
  if (v5)
  {
    long long v6 = v5;
    id v7 = SCNEnclosingURLForSceneDecoder(a3);
    if (v7)
    {
      uint64_t v8 = SCNResolveImageContents(v6, v7);
      if (v8)
      {
        [(SCNMaterialProperty *)self _setImagePath:v6 withResolvedPath:v8];
LABEL_12:
        char v12 = 1;
        goto LABEL_13;
      }
    }
    uint64_t v9 = self;
    double v10 = v6;
LABEL_11:
    [(SCNMaterialProperty *)v9 setContents:v10];
    goto LABEL_12;
  }
  uint64_t v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v11)
  {
    double v10 = (void *)v11;
    uint64_t v9 = self;
    goto LABEL_11;
  }
  double v16 = SCNDecodeImageArray(a3, @"imageArray");
  if (v16)
  {
    double v17 = v16;
    id v18 = SCNEnclosingURLForSceneDecoder(a3);
    if (!v18)
    {
LABEL_37:
      [(SCNMaterialProperty *)self setContents:v17];
      goto LABEL_12;
    }
    BOOL v19 = v18;
    uint64_t v20 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:6];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v21 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v45;
LABEL_30:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v45 != v22) {
          objc_enumerationMutation(v17);
        }
        uint64_t v24 = SCNResolveImageContents(*(void **)(*((void *)&v44 + 1) + 8 * v23), v19);
        if (!v24) {
          goto LABEL_37;
        }
        [v20 addObject:v24];
        if (v21 == ++v23)
        {
          uint64_t v21 = [v17 countByEnumeratingWithState:&v44 objects:v48 count:16];
          if (v21) {
            goto LABEL_30;
          }
          break;
        }
      }
    }
    [(SCNMaterialProperty *)self _updateC3DImageWithContents:v20];
    [(SCNMaterialProperty *)self _clearContents];
    self->_id contents = v17;
    char v12 = 1;
    self->_int contentType = 1;
  }
  else
  {
    uint64_t v25 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
    if (v25)
    {
      [(SCNMaterialProperty *)self setColor:v25];
      goto LABEL_12;
    }
    int v26 = pthread_main_np();
    if (!v26)
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] activateBackground:1];
    }
    uint64_t v27 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v28 = SCNDecodeUnsafeObjectForKey(a3, @"layer", v27);
    if (v28)
    {
      [(SCNMaterialProperty *)self setLayer:v28];
      if (!v26) {
        [MEMORY[0x263F158F8] commit];
      }
      goto LABEL_12;
    }
    if (!v26) {
      [MEMORY[0x263F158F8] commit];
    }
    v29 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    uint64_t v30 = SCNDecodeUnsafeObjectForKey(a3, @"attachment", v29);
    if (v30)
    {
      [(SCNMaterialProperty *)self setAttachment:v30];
      goto LABEL_12;
    }
    if ([a3 containsValueForKey:@"skscene"])
    {
      if (NSClassFromString(&cfstr_Skscene.isa))
      {
        *(void *)&long long v39 = 0;
        *((void *)&v39 + 1) = &v39;
        *(void *)&long long v40 = 0x3052000000;
        *((void *)&v40 + 1) = __Block_byref_object_copy__8;
        *(void *)&long long v41 = __Block_byref_object_dispose__8;
        *((void *)&v41 + 1) = 0;
        if (C3DIsRunningInXcode() && [MEMORY[0x263F08B88] isMainThread])
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __53__SCNMaterialProperty__didDecodeSCNMaterialProperty___block_invoke;
          block[3] = &unk_264009128;
          block[4] = a3;
          block[5] = &v39;
          dispatch_sync(MEMORY[0x263EF83A0], block);
          uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 40);
        }
        else
        {
          uint64_t v32 = (void *)[MEMORY[0x263EFFA08] setWithObject:NSClassFromString(&cfstr_Skscene.isa)];
          uint64_t v31 = SCNDecodeUnsafeObjectForKey(a3, @"skscene", v32);
          *(void *)(*((void *)&v39 + 1) + 40) = v31;
        }
        if (v31)
        {
          -[SCNMaterialProperty setSkScene:](self, "setSkScene:");
          _Block_object_dispose(&v39, 8);
          goto LABEL_12;
        }
        _Block_object_dispose(&v39, 8);
      }
      else
      {
        v33 = scn_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[SCNMaterialProperty _didDecodeSCNMaterialProperty:]();
        }
      }
    }
    if ([a3 containsValueForKey:@"sktexture"])
    {
      if (NSClassFromString(&cfstr_Sktexture.isa))
      {
        v34 = (void *)[MEMORY[0x263EFFA08] setWithObject:NSClassFromString(&cfstr_Sktexture.isa)];
        uint64_t v35 = SCNDecodeUnsafeObjectForKey(a3, @"sktexture", v34);
        if (v35)
        {
          [(SCNMaterialProperty *)self setSkTexture:v35];
          goto LABEL_12;
        }
      }
      else
      {
        v36 = scn_default_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          -[SCNMaterialProperty _didDecodeSCNMaterialProperty:]();
        }
      }
    }
    if ([a3 containsValueForKey:@"float"])
    {
      [a3 decodeFloatForKey:@"float"];
      -[SCNMaterialProperty setFloatValue:](self, "setFloatValue:", objc_msgSend(NSNumber, "numberWithFloat:"));
      goto LABEL_12;
    }
    if ([a3 containsValueForKey:@"precomputedLightingEnvironment"])
    {
      v37 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
      [(SCNMaterialProperty *)self setPrecomputedLightingEnvironment:SCNDecodeUnsafeObjectForKey(a3, @"precomputedLightingEnvironment", v37)];
      goto LABEL_12;
    }
    char v12 = 0;
  }
LABEL_13:
  uint64_t v13 = [a3 decodeIntegerForKey:@"mappingChannel"];
  if (v13 != -1) {
    [(SCNMaterialProperty *)self setMappingChannel:v13];
  }
  if ([a3 containsValueForKey:@"textureComponents"]) {
    -[SCNMaterialProperty setTextureComponents:](self, "setTextureComponents:", [a3 decodeIntegerForKey:@"textureComponents"]);
  }
  self->_int minificationFilter = [a3 decodeIntegerForKey:@"minificationFilter"];
  self->_int magnificationFilter = [a3 decodeIntegerForKey:@"magnificationFilter"];
  self->_int mipFilter = [a3 decodeIntegerForKey:@"mipFilter"];
  self->_int wrapS = [a3 decodeIntegerForKey:@"wrapS"];
  self->_int wrapT = [a3 decodeIntegerForKey:@"wrapT"];
  [(SCNMaterialProperty *)self _updateMaterialFilters];
  self->_maxfloat Anisotropy = 1.0;
  if ([a3 containsValueForKey:@"maxAnisotropy"])
  {
    [a3 decodeFloatForKey:@"maxAnisotropy"];
    if (v14 != 3.4028e38) {
      [(SCNMaterialProperty *)self setMaxAnisotropy:v14];
    }
  }
  if ([a3 containsValueForKey:@"contentsTransform"])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    SCNDecodeSCNMatrix4(a3, @"contentsTransform", &v39);
    v38[0] = v39;
    v38[1] = v40;
    v38[2] = v41;
    v38[3] = v42;
    [(SCNMaterialProperty *)self setContentsTransform:v38];
  }
  if ((v12 & 1) == 0)
  {
    double v15 = [(SCNMaterialProperty *)self effectSlotCreateIfNeeded:0];
    if (v15) {
      C3DEffectSlotSetHasNoContents((uint64_t)v15);
    }
  }
}

uint64_t __53__SCNMaterialProperty__didDecodeSCNMaterialProperty___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CFStringRef v3 = (void *)[MEMORY[0x263EFFA08] setWithObject:NSClassFromString(&cfstr_Skscene.isa)];
  uint64_t result = SCNDecodeUnsafeObjectForKey(v2, @"skscene", v3);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_hasDefaultValues
{
  if ((*((unsigned char *)self + 8) & 2) == 0
    || self->_customSlotName
    || [(SCNOrderedDictionary *)self->_animations count]
    || self->_borderColor
    || self->_contentType
    || self->_mappingChannel > 0
    || self->_intensity != 1.0
    || self->_minificationFilter != 2
    || self->_magnificationFilter != 2
    || self->_mipFilter != 1
    || self->_wrapS != 1
    || self->_wrapT != 1)
  {
    return 0;
  }
  int textureComponents = self->_textureComponents;
  if (textureComponents == 15 || (BOOL result = 0, textureComponents == 8) && self->_propertyType == 15)
  {
    if (!self->_contentTransform && self->_maxAnisotropy == 1.0)
    {
      if (!self->_contents) {
        return 1;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (float *)C3DEffectCommonProfileDefaultColorForEffectProperty(self->_propertyType);
        char v8 = 1;
        v7[0] = objc_msgSend(self->_contents, "scn_C3DColorIgnoringColorSpace:success:", 0, &v8);
        v7[1] = v6;
        if (v8)
        {
          if (C3DColor4IsEqualToColor4WithThreshold((float *)v7, v5)) {
            return 1;
          }
        }
      }
    }
    return 0;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 8)) {
    [(SCNMaterialProperty *)self _syncObjCModel];
  }
  [(SCNMaterialProperty *)self _customEncodingOfSCNMaterialProperty:a3];
  [a3 encodeInt:(*((unsigned __int8 *)self + 8) >> 1) & 1 forKey:@"isCommonProfileProperty"];
  id parent = self->_parent;
  if (parent) {
    [a3 encodeObject:parent forKey:@"parent"];
  }
  unsigned int propertyType = self->_propertyType;
  if (propertyType < 0x1C && ((0xFC0FFFFu >> propertyType) & 1) != 0)
  {
    uint64_t v8 = qword_20B5EE260[(char)propertyType];
  }
  else
  {
    id v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNMaterialProperty encodeWithCoder:]();
    }
    uint64_t v8 = 0;
  }
  [a3 encodeInteger:v8 forKey:@"propertyType"];
  customSlotName = self->_customSlotName;
  if (customSlotName) {
    [a3 encodeObject:customSlotName forKey:@"customSlotName"];
  }
  borderColor = self->_borderColor;
  if (borderColor) {
    SCNEncodeUnsafeObjectForKey(a3, (uint64_t)borderColor, @"borderColor");
  }
  *(float *)&double v9 = self->_intensity;
  [a3 encodeFloat:@"intensity" forKey:v9];
  if ([(SCNMaterialProperty *)self effectSlotCreateIfNeeded:0]) {
    objc_msgSend(a3, "encodeBool:forKey:", -[SCNMaterialProperty sRGBTexture](self, "sRGBTexture"), @"sRGB");
  }
  SCNEncodeAnimations(a3, self);
}

- (SCNMaterialProperty)initWithCoder:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)SCNMaterialProperty;
  uint64_t v4 = [(SCNMaterialProperty *)&v15 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    *((unsigned char *)v4 + 8) |= 8u;
    unint64_t v6 = [a3 decodeIntegerForKey:@"propertyType"];
    if (v6 >= 0x16)
    {
      uint64_t v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SCNMaterialProperty initWithCoder:]();
      }
      char v7 = 0;
    }
    else
    {
      char v7 = byte_20B5EE340[v6];
    }
    v4->_unsigned int propertyType = v7;
    double v9 = (void *)MEMORY[0x263EFFA08];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    v16[3] = objc_opt_class();
    uint64_t v10 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithArray:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v16, 4)), @"parent");
    if ((SCNMaterialProperty *)v10 == v4) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v10;
    }
    v4->_id parent = (id)v11;
    [(SCNMaterialProperty *)v4 _customDecodingOfSCNMaterialProperty:a3];
    *((unsigned char *)v4 + 8) = (2 * ([a3 decodeIntForKey:@"isCommonProfileProperty"] & 1)) | *((unsigned char *)v4 + 8) & 0xFD;
    v4->_customSlotName = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"customSlotName"];
    char v12 = (void *)[MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    [(SCNMaterialProperty *)v4 setBorderColor:SCNDecodeUnsafeObjectForKey(a3, @"borderColor", v12)];
    [a3 decodeFloatForKey:@"intensity"];
    [(SCNMaterialProperty *)v4 setIntensity:v13];
    if ([a3 containsValueForKey:@"sRGB"]) {
      -[SCNMaterialProperty setSRGBTexture:](v4, "setSRGBTexture:", [a3 decodeBoolForKey:@"sRGB"]);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeAnimations(a3, v4);
    [(SCNMaterialProperty *)v4 _didDecodeSCNMaterialProperty:a3];
    *((unsigned char *)v4 + 8) &= ~8u;
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)precomputedLightingEnvironmentDataForContents:(id)a3 device:(id)a4 error:(id *)a5
{
  +[SCNTransaction begin];
  +[SCNTransaction setImmediateMode:1];
  uint64_t v8 = objc_alloc_init(SCNScene);
  double v9 = [(SCNScene *)v8 lightingEnvironment];
  [(SCNMaterialProperty *)v9 setContents:a3];
  uint64_t v10 = [(SCNMaterialProperty *)v9 effectSlot];
  if (!v10)
  {
    uint64_t v11 = scn_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      +[SCNMaterialProperty(SCNMaterialPropertyPrivate_PrecomputedLightingEnvironment) precomputedLightingEnvironmentDataForContents:device:error:](v11);
    }
  }
  +[SCNTransaction commit];
  if (C3DEffectSlotHasImageOrTexture(v10))
  {
    char v12 = [+[SCNRenderer rendererWithDevice:a4 options:0] _renderContextMetal];
    -[SCNMTLRenderContext beginFrame:]((uint64_t)v12, 0);
    uint64_t v13 = -[SCNMTLRenderContext radianceTextureForEffectSlot:](v12, v10);
    float v14 = -[SCNMTLRenderContext irradianceTextureForEffectSlot:](v12, v10);
    uint64_t v21 = 5;
    -[SCNMTLRenderContext endFrameWaitingUntilCompleted:status:error:]((uint64_t)v12, 1, &v21, a5);
    PrecomputedLightingEnvironment = 0;
    if (v13 && v14 && v21 == 4)
    {
      double v16 = (void *)SCNCreateDataWithMTLTexture(v13);
      double v17 = (void *)SCNCreateDataWithMTLTexture(v14);
      PrecomputedLightingEnvironment = objc_alloc_init(SCNPrecomputedLightingEnvironment);
      [(SCNPrecomputedLightingEnvironment *)PrecomputedLightingEnvironment setRadianceData:v16];
      [(SCNPrecomputedLightingEnvironment *)PrecomputedLightingEnvironment setIrradianceData:v17];
    }
  }
  else
  {
    if (!C3DEffectSlotHasPrecomputedLightingEnvironment(v10))
    {

      return 0;
    }
    PrecomputedLightingEnvironment = (SCNPrecomputedLightingEnvironment *)C3DEffectSlotGetPrecomputedLightingEnvironment(v10);
    id v18 = PrecomputedLightingEnvironment;
  }

  if (!PrecomputedLightingEnvironment) {
    return 0;
  }
  BOOL v19 = (void *)[MEMORY[0x263F08910] archivedDataWithRootObject:PrecomputedLightingEnvironment requiringSecureCoding:1 error:a5];

  return v19;
}

- (void)setWrapS:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: invalid wrapS value: %d", (uint8_t *)v2, 8u);
}

- (void)setWrapT:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: invalid wrapT value: %d", (uint8_t *)v2, 8u);
}

- (void)image
{
}

- (void)setContentsTransform:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = "-[SCNMaterialProperty setContentsTransform:]";
  __int16 v4 = 1024;
  int v5 = 1683;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", (uint8_t *)&v2, 0x1Cu);
}

- (void)propertyName
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = [a1 propertyType];
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: slotName %d not found", (uint8_t *)v3, 8u);
}

+ (void)copyC3DImageFromImage:textureOptions:wasCached:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Array for material property contents must have 6 elements", v2, v3, v4, v5, v6);
}

- (void)parentWillDie:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updateMaterialAttachment:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_didDecodeSCNMaterialProperty:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SKTexture not found - missing linkage with SpriteKit?", v2, v3, v4, v5, v6);
}

- (void)encodeWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unknown material property type for archiving", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unknown archived material property type", v2, v3, v4, v5, v6);
}

@end