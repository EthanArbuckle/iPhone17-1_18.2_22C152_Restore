@interface SCNCamera
+ (BOOL)supportsSecureCoding;
+ (SCNCamera)camera;
+ (SCNCamera)cameraWithCameraRef:(__C3DCamera *)a3;
+ (SCNCamera)cameraWithMDLCamera:(MDLCamera *)mdlCamera;
+ (id)keyPathsForValuesAffectingFieldOfView;
+ (id)keyPathsForValuesAffectingFocalLength;
- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4;
- (BOOL)automaticallyAdjustsZRange;
- (BOOL)grainIsColored;
- (BOOL)hasCustomProjectionTransform;
- (BOOL)isAnimationForKeyPaused:(id)a3;
- (BOOL)isPausedOrPausedByInheritance;
- (BOOL)useLegacyFov;
- (BOOL)usesOrthographicProjection;
- (BOOL)wantsDepthOfField;
- (BOOL)wantsExposureAdaptation;
- (BOOL)wantsHDR;
- (CGAffineTransform)postProjectionTransform;
- (CGFloat)aperture;
- (CGFloat)averageGray;
- (CGFloat)bloomBlurRadius;
- (CGFloat)bloomIntensity;
- (CGFloat)bloomIterationSpread;
- (CGFloat)bloomThreshold;
- (CGFloat)colorFringeIntensity;
- (CGFloat)colorFringeStrength;
- (CGFloat)contrast;
- (CGFloat)exposureAdaptationBrighteningSpeedFactor;
- (CGFloat)exposureAdaptationDarkeningSpeedFactor;
- (CGFloat)exposureOffset;
- (CGFloat)fStop;
- (CGFloat)fieldOfView;
- (CGFloat)focalBlurRadius;
- (CGFloat)focalLength;
- (CGFloat)focalSize;
- (CGFloat)focusDistance;
- (CGFloat)grainIntensity;
- (CGFloat)grainScale;
- (CGFloat)maximumExposure;
- (CGFloat)minimumExposure;
- (CGFloat)motionBlurIntensity;
- (CGFloat)saturation;
- (CGFloat)screenSpaceAmbientOcclusionBias;
- (CGFloat)screenSpaceAmbientOcclusionDepthThreshold;
- (CGFloat)screenSpaceAmbientOcclusionIntensity;
- (CGFloat)screenSpaceAmbientOcclusionNormalThreshold;
- (CGFloat)screenSpaceAmbientOcclusionRadius;
- (CGFloat)sensorHeight;
- (CGFloat)vignettingIntensity;
- (CGFloat)vignettingPower;
- (CGFloat)whiteBalanceTemperature;
- (CGFloat)whiteBalanceTint;
- (CGFloat)whitePoint;
- (NSArray)animationKeys;
- (NSInteger)apertureBladeCount;
- (NSInteger)bloomIterationCount;
- (NSInteger)focalBlurSampleCount;
- (NSString)description;
- (NSString)name;
- (NSUInteger)categoryBitMask;
- (SCNCamera)init;
- (SCNCamera)initWithCameraRef:(__C3DCamera *)a3;
- (SCNCamera)initWithCoder:(id)a3;
- (SCNCameraProjectionDirection)projectionDirection;
- (SCNMaterialProperty)colorGrading;
- (SCNMatrix4)projectionTransform;
- (SCNMatrix4)projectionTransformWithViewportSize:(SEL)a3;
- (SCNTechnique)technique;
- (__C3DAnimationManager)animationManager;
- (__C3DCamera)cameraRef;
- (__C3DScene)sceneRef;
- (double)aspectRatio;
- (double)exposureAdaptationDuration;
- (double)exposureAdaptationHistogramRangeHighProbability;
- (double)exposureAdaptationHistogramRangeLowProbability;
- (double)grainSlice;
- (double)lensShift;
- (double)orthographicScale;
- (double)xFov;
- (double)yFov;
- (double)zFar;
- (double)zNear;
- (float)dofIntensity;
- (id)_scnAnimationForKey:(id)a3;
- (id)_scnBindings;
- (id)animationForKey:(id)a3;
- (id)animationPlayerForKey:(id)a3;
- (id)copy;
- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugQuickLookData;
- (id)debugQuickLookObject;
- (id)grainTexture;
- (id)identifier;
- (id)initPresentationCameraWithCameraRef:(__C3DCamera *)a3;
- (id)presentationCamera;
- (id)scene;
- (int64_t)exposureAdaptationMode;
- (int64_t)fillMode;
- (int64_t)screenSpaceAmbientOcclusionDownSample;
- (int64_t)screenSpaceAmbientOcclusionSampleCount;
- (void)__CFObject;
- (void)_checkSettingsConsistency;
- (void)_copyAnimationsFrom:(id)a3;
- (void)_customEncodingOfSCNCamera:(id)a3;
- (void)_didDecodeSCNCamera:(id)a3;
- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5;
- (void)_syncEntityObjCModel;
- (void)_syncObjCAnimations;
- (void)_syncObjCModel;
- (void)_updateFieldOfView;
- (void)_updateFocalLength;
- (void)addAnimation:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addAnimationPlayer:(id)a3 forKey:(id)a4;
- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pauseAnimationForKey:(id)a3;
- (void)removeAllAnimations;
- (void)removeAllAnimationsWithBlendOutDuration:(double)a3;
- (void)removeAllBindings;
- (void)removeAnimationForKey:(id)a3;
- (void)removeAnimationForKey:(id)a3 blendOutDuration:(double)a4;
- (void)resumeAnimationForKey:(id)a3;
- (void)setAperture:(CGFloat)aperture;
- (void)setApertureBladeCount:(NSInteger)apertureBladeCount;
- (void)setAspectRatio:(double)a3;
- (void)setAutomaticallyAdjustsZRange:(BOOL)automaticallyAdjustsZRange;
- (void)setAverageGray:(CGFloat)averageGray;
- (void)setBloomBlurRadius:(CGFloat)bloomBlurRadius;
- (void)setBloomIntensity:(CGFloat)bloomIntensity;
- (void)setBloomIterationCount:(NSInteger)bloomIterationCount;
- (void)setBloomIterationSpread:(CGFloat)bloomIterationSpread;
- (void)setBloomThreshold:(CGFloat)bloomThreshold;
- (void)setCategoryBitMask:(NSUInteger)categoryBitMask;
- (void)setColorFringeIntensity:(CGFloat)colorFringeIntensity;
- (void)setColorFringeStrength:(CGFloat)colorFringeStrength;
- (void)setContrast:(CGFloat)contrast;
- (void)setDofIntensity:(float)a3;
- (void)setExposureAdaptationBrighteningSpeedFactor:(CGFloat)exposureAdaptationBrighteningSpeedFactor;
- (void)setExposureAdaptationDarkeningSpeedFactor:(CGFloat)exposureAdaptationDarkeningSpeedFactor;
- (void)setExposureAdaptationDuration:(double)a3;
- (void)setExposureAdaptationHistogramRangeHighProbability:(double)a3;
- (void)setExposureAdaptationHistogramRangeLowProbability:(double)a3;
- (void)setExposureAdaptationMode:(int64_t)a3;
- (void)setExposureOffset:(CGFloat)exposureOffset;
- (void)setFStop:(CGFloat)fStop;
- (void)setFieldOfView:(CGFloat)fieldOfView;
- (void)setFillMode:(int64_t)a3;
- (void)setFocalBlurSampleCount:(NSInteger)focalBlurSampleCount;
- (void)setFocalLength:(CGFloat)focalLength;
- (void)setFocusDistance:(CGFloat)focusDistance;
- (void)setGrainIntensity:(CGFloat)grainIntensity;
- (void)setGrainIsColored:(BOOL)grainIsColored;
- (void)setGrainScale:(CGFloat)grainScale;
- (void)setGrainSlice:(double)a3;
- (void)setGrainTexture:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLensShift:(SCNCamera *)self;
- (void)setMaximumExposure:(CGFloat)maximumExposure;
- (void)setMinimumExposure:(CGFloat)minimumExposure;
- (void)setMotionBlurIntensity:(CGFloat)motionBlurIntensity;
- (void)setName:(NSString *)name;
- (void)setOrthographicScale:(double)orthographicScale;
- (void)setPostProjectionTransform:(CGAffineTransform *)a3;
- (void)setPostProjectionTransformScale:(SCNCamera *)self;
- (void)setPostProjectionTransformTranslation:(SCNCamera *)self;
- (void)setProjectionDirection:(SCNCameraProjectionDirection)projectionDirection;
- (void)setProjectionTransform:(SCNMatrix4 *)projectionTransform;
- (void)setSaturation:(CGFloat)saturation;
- (void)setScreenSpaceAmbientOcclusionBias:(CGFloat)screenSpaceAmbientOcclusionBias;
- (void)setScreenSpaceAmbientOcclusionDepthThreshold:(CGFloat)screenSpaceAmbientOcclusionDepthThreshold;
- (void)setScreenSpaceAmbientOcclusionDownSample:(int64_t)a3;
- (void)setScreenSpaceAmbientOcclusionIntensity:(CGFloat)screenSpaceAmbientOcclusionIntensity;
- (void)setScreenSpaceAmbientOcclusionNormalThreshold:(CGFloat)screenSpaceAmbientOcclusionNormalThreshold;
- (void)setScreenSpaceAmbientOcclusionRadius:(CGFloat)screenSpaceAmbientOcclusionRadius;
- (void)setScreenSpaceAmbientOcclusionSampleCount:(int64_t)a3;
- (void)setSensorHeight:(CGFloat)sensorHeight;
- (void)setSpeed:(double)a3 forAnimationKey:(id)a4;
- (void)setTechnique:(id)a3;
- (void)setUsesOrthographicProjection:(BOOL)usesOrthographicProjection;
- (void)setVignettingIntensity:(CGFloat)vignettingIntensity;
- (void)setVignettingPower:(CGFloat)vignettingPower;
- (void)setWantsDepthOfField:(BOOL)wantsDepthOfField;
- (void)setWantsExposureAdaptation:(BOOL)wantsExposureAdaptation;
- (void)setWantsHDR:(BOOL)wantsHDR;
- (void)setWhiteBalanceTemperature:(CGFloat)whiteBalanceTemperature;
- (void)setWhiteBalanceTint:(CGFloat)whiteBalanceTint;
- (void)setWhitePoint:(CGFloat)whitePoint;
- (void)setXFov:(double)xFov;
- (void)setYFov:(double)yFov;
- (void)setZFar:(double)zFar;
- (void)setZNear:(double)zNear;
- (void)unbindAnimatablePath:(id)a3;
@end

@implementation SCNCamera

+ (SCNCamera)camera
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNCamera *)v2;
}

- (SCNCamera)init
{
  v5.receiver = self;
  v5.super_class = (Class)SCNCamera;
  id v2 = [(SCNCamera *)&v5 init];
  if (v2)
  {
    uint64_t v3 = C3DCameraCreate();
    v2->_camera = (__C3DCamera *)v3;
    if (v3) {
      C3DEntitySetObjCWrapper(v3, v2);
    }
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNCamera *)v2 _syncObjCModel];
  }
  return v2;
}

- (__C3DCamera)cameraRef
{
  return *(__C3DCamera **)(v0 + 8);
}

- (void)_syncEntityObjCModel
{
  uint64_t v3 = [(SCNCamera *)self __CFObject];

  self->_name = (NSString *)(id)C3DEntityGetName((uint64_t)v3);
}

- (__C3DScene)sceneRef
{
  id v2 = [(SCNCamera *)self __CFObject];

  return (__C3DScene *)C3DGetScene(v2);
}

- (void)__CFObject
{
  return self->_camera;
}

- (void)_syncObjCModel
{
  uint64_t v3 = [(SCNCamera *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  *(float *)&self->_categoryBitMask = C3DCameraGetAspectRatio((uint64_t)self->_camera);
  self->_sensorSize = C3DCameraGetSensorSize((uint64_t)self->_camera);
  *(double *)&self->_lensShift[4] = C3DCameraGetLensShift((uint64_t)self->_camera);
  *(double *)&self->_postProjectionTransformTranslation[4] = C3DCameraGetPostProjectionTransformTranslation((uint64_t)self->_camera);
  *(double *)&self->_postProjectionTransformScale[4] = C3DCameraGetPostProjectionTransformScale((uint64_t)self->_camera);
  if (C3DCameraUsesLegacyFov((uint64_t)self->_camera)) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xFB | v5;
  uint64_t ProjectionInfosPtr = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_orthographicScale = C3DProjectionInfosGetOrthographicScale(ProjectionInfosPtr);
  uint64_t v7 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_zFar = C3DProjectionInfosGetZFar(v7);
  uint64_t v8 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  self->_zNear = C3DProjectionInfosGetZNear(v8);
  *(float *)&self->_bladeCount = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
  self->_focalLength = C3DCameraGetFocalLength((uint64_t)self->_camera);
  self->_dofIntensity = C3DCameraGetFocusDistance((uint64_t)self->_camera);
  self->_focusDistance = C3DCameraGetFStop((uint64_t)self->_camera);
  self->_focalBlurSampleCount = (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  *(void *)&self->_aspectRatio = (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  *(void *)&self->_projectionTransform.m11 = C3DCameraGetCategoryBitMask((uint64_t)self->_camera);
  LOBYTE(self->_averageGray) = C3DCameraGetWantsHDR((uint64_t)self->_camera);
  self->_exposureOffset = C3DCameraGetWhitePoint((uint64_t)self->_camera);
  self->_minimumExposure = C3DCameraGetAverageGray((uint64_t)self->_camera);
  LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) = C3DCameraGetWantsExposureAdaptation((uint64_t)self->_camera);
  self->_maximumExposure = C3DCameraGetExposureOffset((uint64_t)self->_camera);
  self->_exposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
  *(float *)&self->_exposureAdaptationHistogramRangeHighProbability = C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
  *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) = C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
  *(double *)&self->_exposureAdaptationMode = C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  self->_exposureAdaptationHistogramRangeLowProbability = C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  *(void *)&self->_bloomIntensity = C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  if (C3DCameraGetFovIsHorizontal((uint64_t)self->_camera)) {
    char v9 = 64;
  }
  else {
    char v9 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xBF | v9;
  char v10 = C3DCameraUsesLegacyFov((uint64_t)self->_camera);
  char v11 = *((unsigned char *)self + 16);
  if (v10)
  {
    *((unsigned char *)self + 16) = v11 | 4;
    uint64_t v12 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
    double XFov = C3DProjectionInfosGetXFov(v12);
    if (v11)
    {
      float v17 = XFov;
      self->_xfloat Fov = v17;
      uint64_t v18 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
      Yfloat Fov = C3DProjectionInfosGetYFov(v18);
      self->_yfloat Fov = YFov;
    }
    else
    {
      [(SCNCamera *)self setXFov:XFov];
      uint64_t v14 = C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
      [(SCNCamera *)self setYFov:C3DProjectionInfosGetYFov(v14)];
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v11 & 0xFB;
    float Fov = C3DCameraGetFov((uint64_t)self->_camera);
    self->_fieldOfView = Fov;
    if ((*((unsigned char *)self + 16) & 0x40) != 0) {
      float v16 = 0.0;
    }
    else {
      float v16 = Fov;
    }
    if ((*((unsigned char *)self + 16) & 0x40) == 0) {
      float Fov = 0.0;
    }
    self->_xfloat Fov = Fov;
    self->_yfloat Fov = v16;
  }
  *(float *)&self->_wantsExposureAdaptation = C3DCameraGetMinimumExposure((uint64_t)self->_camera);
  self->_exposureAdaptationDuration = C3DCameraGetMaximumExposure((uint64_t)self->_camera);
  *(float *)&self->_bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
  self->_bloomIterationSpread = C3DCameraGetBloomThreshold((uint64_t)self->_camera);
  LODWORD(self->_bloomBlurRadius) = C3DCameraGetBloomIteration((uint64_t)self->_camera);
  self->_motionBlurIntensity = C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
  self->_vignettingPower = C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
  self->_vignettingIntensity = C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
  self->_colorFringeStrength = C3DCameraGetVignettingPower((uint64_t)self->_camera);
  self->_colorFringeIntensity = C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
  self->_saturation = C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
  self->_contrast = C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
  self->_grainIntensity = C3DCameraGetSaturation((uint64_t)self->_camera);
  self->_grainScale = C3DCameraGetContrast((uint64_t)self->_camera);
  *(float *)&self->_grainIsColored = C3DCameraGetGrainIntensity((uint64_t)self->_camera);
  self->_whiteBalanceTemperature = C3DCameraGetGrainScale((uint64_t)self->_camera);
  LOBYTE(self->_whiteBalanceTint) = C3DCameraGetGrainIsColored((uint64_t)self->_camera);
  *(float *)&self[1].super.isa = C3DCameraGetARGrainSlice((uint64_t)self->_camera);
  *(void *)&self->_grainSlice = C3DCameraGetARGrainTexture((uint64_t)self->_camera);
  *(&self->_whiteBalanceTint + 1) = C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.intensity = C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.bias = C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.depthThreshold = C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.normalThreshold = C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
  *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) = C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
  *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount = C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
  self->_screenSpaceAmbientOcclusion.downSample = (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  self->_grainTexture = (MTLTexture *)(int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  v20 = (unsigned char *)C3DCameraGetProjectionInfosPtr((uint64_t)self->_camera);
  if (C3DProjectionInfosGetOrtho(v20)) {
    char v21 = 8;
  }
  else {
    char v21 = 0;
  }
  *((unsigned char *)self + 16) = *((unsigned char *)self + 16) & 0xF7 | v21;
  [(SCNCamera *)self _updateFocalLength];
  [(SCNCamera *)self _syncEntityObjCModel];
  if (v4)
  {
    C3DSceneUnlock(v4);
  }
}

- (void)_updateFocalLength
{
  float v3 = self->_fieldOfView / 180.0 * 3.14159265;
  double v4 = self->_sensorSize * 0.5;
  float v5 = v4 / tanf(v3 * 0.5);
  self->_focalLength = v5;
}

+ (SCNCamera)cameraWithMDLCamera:(MDLCamera *)mdlCamera
{
  double v4 = (SCNCamera *)[a1 camera];
  [(MDLCamera *)mdlCamera focalLength];
  [(SCNCamera *)v4 setFocalLength:v5];
  [(MDLCamera *)mdlCamera sensorVerticalAperture];
  [(SCNCamera *)v4 setSensorHeight:v6];
  [(MDLCamera *)mdlCamera fStop];
  [(SCNCamera *)v4 setFStop:v7];
  [(MDLCamera *)mdlCamera focusDistance];
  [(SCNCamera *)v4 setFocusDistance:v8];
  [(MDLCamera *)mdlCamera sensorAspect];
  [(SCNCamera *)v4 setAspectRatio:v9];
  [(SCNCamera *)v4 setApertureBladeCount:[(MDLCamera *)mdlCamera apertureBladeCount]];
  [(MDLCamera *)mdlCamera nearVisibilityDistance];
  [(SCNCamera *)v4 setZNear:v10];
  [(MDLCamera *)mdlCamera farVisibilityDistance];
  [(SCNCamera *)v4 setZFar:v11];
  [(SCNCamera *)v4 setFocalBlurRadius:0.0];
  [(SCNCamera *)v4 setUsesOrthographicProjection:[(MDLCamera *)mdlCamera projection] == MDLCameraProjectionOrthographic];
  if ([(MDLCamera *)mdlCamera focalLengthAnimation])
  {
    [(MDLCamera *)mdlCamera focalLengthAnimation];
    uint64_t v12 = objc_opt_class();
    if ([v12 isSubclassOfClass:objc_opt_class()])
    {
      v13 = (void *)[(MDLCamera *)mdlCamera focalLengthAnimation];
      uint64_t v14 = (void *)[v13 values];
      uint64_t v15 = [v14 count];
      float v16 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v15];
      [(MDLCamera *)mdlCamera sensorVerticalAperture];
      if (v15)
      {
        float v18 = v17;
        for (uint64_t i = 0; i != v15; ++i)
        {
          objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", i), "floatValue");
          *(float *)&double v21 = (float)(atanf(v18 / (float)(v20 + v20)) * 360.0) / 3.1416;
          objc_msgSend(v16, "addObject:", objc_msgSend(NSNumber, "numberWithFloat:", v21));
        }
      }
      v22 = (void *)[MEMORY[0x263F157D8] animation];
      [v22 setKeyPath:@"fieldOfView"];
      [v22 setValues:v16];
      objc_msgSend(v22, "setKeyTimes:", objc_msgSend(v13, "keyTimes"));
      [v13 duration];
      objc_msgSend(v22, "setDuration:");
      [v22 setUsesSceneTimeBase:1];
      [v22 setRemovedOnCompletion:0];
      [(SCNCamera *)v4 addAnimation:v22 forKey:0];
    }
  }
  if ([(MDLCamera *)mdlCamera focalDistanceAnimation]) {
    [(SCNCamera *)v4 addAnimation:[(MDLCamera *)mdlCamera focalDistanceAnimation] forKey:@"focalDistance"];
  }
  if ([(MDLCamera *)mdlCamera fStopAnimation]) {
    [(SCNCamera *)v4 addAnimation:[(MDLCamera *)mdlCamera fStopAnimation] forKey:@"fstop"];
  }
  return v4;
}

- (SCNCamera)initWithCameraRef:(__C3DCamera *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SCNCamera;
  double v4 = [(SCNCamera *)&v7 init];
  if (v4)
  {
    float v5 = (__C3DCamera *)CFRetain(a3);
    v4->_camera = v5;
    if (v5) {
      C3DEntitySetObjCWrapper((uint64_t)v5, v4);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    [(SCNCamera *)v4 _syncObjCModel];
    [(SCNCamera *)v4 _syncObjCAnimations];
  }
  return v4;
}

- (id)initPresentationCameraWithCameraRef:(__C3DCamera *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SCNCamera;
  double v4 = [(SCNCamera *)&v9 init];
  float v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 16) |= 1u;
    float v6 = (__C3DCamera *)CFRetain(a3);
    v5->_camera = v6;
    if (C3DCameraUsesLegacyFov((uint64_t)v6)) {
      char v7 = 4;
    }
    else {
      char v7 = 0;
    }
    *((unsigned char *)v5 + 16) = *((unsigned char *)v5 + 16) & 0xFB | v7;
    v5->_animationsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (SCNCamera)cameraWithCameraRef:(__C3DCamera *)a3
{
  result = (SCNCamera *)C3DEntityGetObjCWrapper((id *)a3);
  if (!result)
  {
    float v6 = (void *)[objc_alloc((Class)a1) initWithCameraRef:a3];
    return (SCNCamera *)v6;
  }
  return result;
}

- (void)dealloc
{
  camera = self->_camera;
  if (camera)
  {
    if ((*((unsigned char *)self + 16) & 1) == 0)
    {
      C3DEntitySetObjCWrapper((uint64_t)camera, 0);
      camera = self->_camera;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __20__SCNCamera_dealloc__block_invoke;
    v5[3] = &__block_descriptor_40_e8_v16__0d8l;
    v5[4] = camera;
    +[SCNTransaction postCommandWithContext:0 object:0 applyBlock:v5];
  }

  [*(id *)&self->_wantsHDR parentWillDie:self];
  v4.receiver = self;
  v4.super_class = (Class)SCNCamera;
  [(SCNCamera *)&v4 dealloc];
}

void __20__SCNCamera_dealloc__block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  NSUInteger v3 = [(NSString *)[(SCNCamera *)self name] length];
  objc_super v4 = NSString;
  float v5 = (objc_class *)objc_opt_class();
  float v6 = NSStringFromClass(v5);
  if (v3) {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p '%@'>", v6, self, -[SCNCamera name](self, "name")];
  }
  else {
    return (NSString *)[v4 stringWithFormat:@"<%@: %p>", v6, self, v8];
  }
}

- (void)setName:(NSString *)name
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setName:]();
    }
  }
  else if ((unint64_t)name | (unint64_t)self->_name)
  {
    if ((-[NSString isEqual:](name, "isEqual:") & 1) == 0)
    {

      self->_name = (NSString *)[(NSString *)name copy];
      float v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __21__SCNCamera_setName___block_invoke;
      v7[3] = &unk_264006160;
      v7[4] = self;
      v7[5] = name;
      +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
    }
  }
}

CFStringRef __21__SCNCamera_setName___block_invoke(uint64_t a1)
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
  objc_super v4 = [(SCNCamera *)self sceneRef];
  uint64_t v5 = (uint64_t)v4;
  if (v4) {
    C3DSceneLock((uint64_t)v4);
  }
  Name = (NSString *)C3DEntityGetName((uint64_t)[(SCNCamera *)self __CFObject]);
  if (v5) {
    C3DSceneUnlock(v5);
  }
  return Name;
}

- (void)setIdentifier:(id)a3
{
  objc_super v4 = [(SCNCamera *)self __CFObject];

  C3DEntitySetID((uint64_t)v4, a3);
}

- (id)identifier
{
  uint64_t v2 = [(SCNCamera *)self __CFObject];

  return (id)C3DEntityGetID((uint64_t)v2);
}

- (id)scene
{
  id result = [(SCNCamera *)self sceneRef];
  if (result)
  {
    return C3DEntityGetObjCWrapper((id *)result);
  }
  return result;
}

- (__C3DAnimationManager)animationManager
{
  id result = [(SCNCamera *)self sceneRef];
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
    objc_super v9 = [(SCNCamera *)self __CFObject];
    if ((CFTypeIsC3DEntity(v9) & 1) == 0)
    {
      float v10 = scn_default_log();
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
    BOOL v8 = [(SCNCamera *)self sceneRef];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__SCNCamera_addAnimationPlayer_forKey___block_invoke;
    v10[3] = &unk_264006138;
    v10[4] = a3;
    v10[5] = self;
    v10[6] = v5;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v10];
  }
  else
  {
    objc_super v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNTechnique addAnimationPlayer:forKey:]((uint64_t)self, v9);
    }
  }
}

void __39__SCNCamera_addAnimationPlayer_forKey___block_invoke(id *a1)
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
    float v6 = (SCNAnimation *)a3;
    if (!a4) {
      id v5 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      float v6 = +[SCNAnimation animationWithCAAnimation:v6];
    }
    char v7 = +[SCNAnimationPlayer animationPlayerWithSCNAnimation:v6];
    [(SCNCamera *)self addAnimationPlayer:v7 forKey:v5];
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
  objc_super v4 = [(SCNCamera *)self sceneRef];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__SCNCamera_removeAllAnimations__block_invoke;
  v5[3] = &unk_264005010;
  v5[4] = self;
  +[SCNTransaction postCommandWithContext:v4 object:self applyBlock:v5];
}

void __32__SCNCamera_removeAllAnimations__block_invoke(uint64_t a1)
{
}

- (void)removeAllAnimationsWithBlendOutDuration:(double)a3
{
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  [(SCNOrderedDictionary *)self->_animations removeAllObjects];
  os_unfair_lock_unlock(p_animationsLock);
  float v6 = [(SCNCamera *)self sceneRef];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__SCNCamera_removeAllAnimationsWithBlendOutDuration___block_invoke;
  v7[3] = &unk_264004FC0;
  v7[4] = self;
  *(double *)&v7[5] = a3;
  +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
}

void __53__SCNCamera_removeAllAnimationsWithBlendOutDuration___block_invoke(uint64_t a1)
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
    float v6 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__SCNCamera_removeAnimationForKey___block_invoke;
    v7[3] = &unk_264006160;
    v7[4] = self;
    v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __35__SCNCamera_removeAnimationForKey___block_invoke(uint64_t a1)
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
    BOOL v8 = [(SCNCamera *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52__SCNCamera_removeAnimationForKey_blendOutDuration___block_invoke;
    v9[3] = &unk_264004E20;
    v9[4] = self;
    v9[5] = a3;
    *(double *)&v9[6] = a4;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __52__SCNCamera_removeAnimationForKey_blendOutDuration___block_invoke(uint64_t a1)
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
  CFStringRef v3 = [(SCNCamera *)self sceneRef];
  uint64_t v4 = (uint64_t)v3;
  if (v3) {
    C3DSceneLock((uint64_t)v3);
  }
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(SCNOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  id v5 = [(SCNCamera *)self __CFObject];
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    if ((CFTypeIsC3DEntity(v5) & 1) == 0)
    {
      char v7 = scn_default_log();
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
  id v3 = [(SCNCamera *)self _scnAnimationForKey:a3];
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
        [(SCNCamera *)self addAnimationPlayer:v11 forKey:v10];
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
  uint64_t v9 = [(SCNCamera *)self __CFObject];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [(SCNCamera *)self animationManager];
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
  BOOL v5 = [(SCNCamera *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SCNCamera_pauseAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __34__SCNCamera_pauseAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:1 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)resumeAnimationForKey:(id)a3
{
  BOOL v5 = [(SCNCamera *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__SCNCamera_resumeAnimationForKey___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

uint64_t __35__SCNCamera_resumeAnimationForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseAnimation:0 forKey:*(void *)(a1 + 40) pausedByNode:0];
}

- (void)setSpeed:(double)a3 forAnimationKey:(id)a4
{
  uint64_t v7 = [NSString stringWithFormat:@"animations.%@.speed", a4];
  uint64_t v8 = [(SCNCamera *)self sceneRef];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__SCNCamera_setSpeed_forAnimationKey___block_invoke;
  v9[3] = &unk_264004E20;
  v9[4] = self;
  v9[5] = a4;
  *(double *)&v9[6] = a3;
  +[SCNTransaction postCommandWithContext:v8 object:self keyPath:v7 applyBlock:v9];
}

void __38__SCNCamera_setSpeed_forAnimationKey___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNCamera *)self sceneRef];
  uint64_t v6 = (uint64_t)v5;
  if (v5) {
    C3DSceneLock((uint64_t)v5);
  }
  uint64_t v7 = [(SCNCamera *)self __CFObject];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [(SCNCamera *)self animationManager];
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

    long long v15 = [(SCNCamera *)self sceneRef];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __61__SCNCamera_bindAnimatablePath_toObject_withKeyPath_options___block_invoke;
    v16[3] = &unk_264006188;
    v16[4] = self;
    v16[5] = a4;
    v16[6] = a3;
    v16[7] = a5;
    v16[8] = a6;
    +[SCNTransaction postCommandWithContext:v15 object:self applyBlock:v16];
  }
}

void __61__SCNCamera_bindAnimatablePath_toObject_withKeyPath_options___block_invoke(uint64_t a1)
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
  BOOL v5 = [(SCNCamera *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__SCNCamera_unbindAnimatablePath___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = self;
  v6[5] = a3;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __34__SCNCamera_unbindAnimatablePath___block_invoke(uint64_t a1)
{
  uint64_t v2 = (float32x4_t *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");
  CFStringRef v3 = *(const __CFString **)(a1 + 40);

  C3DEntityRemoveBindingWithKeyPath(v2, v3);
}

- (void)removeAllBindings
{
  self->_bindings = 0;
  CFStringRef v3 = [(SCNCamera *)self sceneRef];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__SCNCamera_removeAllBindings__block_invoke;
  v4[3] = &unk_264005010;
  v4[4] = self;
  +[SCNTransaction postCommandWithContext:v3 object:self applyBlock:v4];
}

void __30__SCNCamera_removeAllBindings__block_invoke(uint64_t a1)
{
  v1 = (CFTypeRef *)objc_msgSend(*(id *)(a1 + 32), "__CFObject");

  C3DEntityRemoveAllBindings(v1);
}

- (void)setTechnique:(id)a3
{
  self->_colorGrading = (SCNMaterialProperty *)a3;
  BOOL v5 = [(SCNCamera *)self sceneRef];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__SCNCamera_setTechnique___block_invoke;
  v6[3] = &unk_264006160;
  v6[4] = a3;
  v6[5] = self;
  +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v6];
}

void __26__SCNCamera_setTechnique___block_invoke(uint64_t a1)
{
  uint64_t v2 = (const void *)[*(id *)(a1 + 32) techniqueRef];
  CFStringRef v3 = (void *)[*(id *)(a1 + 40) cameraRef];

  C3DCameraSetTechnique(v3, v2);
}

- (SCNTechnique)technique
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (SCNTechnique *)self->_colorGrading;
  }
  uint64_t v4 = [(SCNCamera *)self sceneRef];
  if (!v4)
  {
    uint64_t Technique = C3DCameraGetTechnique((uint64_t)self->_camera);
    if (Technique) {
      goto LABEL_5;
    }
    return 0;
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  uint64_t Technique = C3DCameraGetTechnique((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  if (!Technique) {
    return 0;
  }
LABEL_5:

  return +[SCNTechnique techniqueWithTechniqueRef:Technique];
}

- (id)presentationCamera
{
  if ((*((unsigned char *)self + 16) & 1) == 0)
  {
    id v2 = [[SCNCamera alloc] initPresentationCameraWithCameraRef:*((void *)self + 1)];
    return v2;
  }
  return self;
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (BOOL)hasCustomProjectionTransform
{
  return (*((unsigned __int8 *)self + 16) >> 1) & 1;
}

- (CGFloat)screenSpaceAmbientOcclusionIntensity
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ScreenSpaceAmbientOcclusionIntensity = C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.bias;
  }
  return ScreenSpaceAmbientOcclusionIntensity;
}

- (void)setScreenSpaceAmbientOcclusionIntensity:(CGFloat)screenSpaceAmbientOcclusionIntensity
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionIntensity:]();
    }
  }
  else
  {
    float v4 = screenSpaceAmbientOcclusionIntensity;
    if (self->_screenSpaceAmbientOcclusion.bias != v4)
    {
      self->_screenSpaceAmbientOcclusion.bias = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __53__SCNCamera_setScreenSpaceAmbientOcclusionIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"screenSpaceAmbientOcclusionIntensity" applyBlock:v7];
    }
  }
}

void __53__SCNCamera_setScreenSpaceAmbientOcclusionIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)screenSpaceAmbientOcclusionRadius
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ScreenSpaceAmbientOcclusionRadius = C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionRadius((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.depthThreshold;
  }
  return ScreenSpaceAmbientOcclusionRadius;
}

- (void)setScreenSpaceAmbientOcclusionRadius:(CGFloat)screenSpaceAmbientOcclusionRadius
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionRadius:]();
    }
  }
  else
  {
    float v4 = screenSpaceAmbientOcclusionRadius;
    if (self->_screenSpaceAmbientOcclusion.depthThreshold != v4)
    {
      self->_screenSpaceAmbientOcclusion.depthThreshold = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __50__SCNCamera_setScreenSpaceAmbientOcclusionRadius___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"screenSpaceAmbientOcclusionRadius" applyBlock:v7];
    }
  }
}

void __50__SCNCamera_setScreenSpaceAmbientOcclusionRadius___block_invoke(uint64_t a1)
{
}

- (CGFloat)screenSpaceAmbientOcclusionBias
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ScreenSpaceAmbientOcclusionBias = C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionBias((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.normalThreshold;
  }
  return ScreenSpaceAmbientOcclusionBias;
}

- (void)setScreenSpaceAmbientOcclusionBias:(CGFloat)screenSpaceAmbientOcclusionBias
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionBias:]();
    }
  }
  else
  {
    float v4 = screenSpaceAmbientOcclusionBias;
    if (self->_screenSpaceAmbientOcclusion.normalThreshold != v4)
    {
      self->_screenSpaceAmbientOcclusion.normalThreshold = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __48__SCNCamera_setScreenSpaceAmbientOcclusionBias___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"screenSpaceAmbientOcclusionBias" applyBlock:v7];
    }
  }
}

void __48__SCNCamera_setScreenSpaceAmbientOcclusionBias___block_invoke(uint64_t a1)
{
}

- (CGFloat)screenSpaceAmbientOcclusionDepthThreshold
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ScreenSpaceAmbientOcclusionDepthThreshold = C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionDepthThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1);
  }
  return ScreenSpaceAmbientOcclusionDepthThreshold;
}

- (void)setScreenSpaceAmbientOcclusionDepthThreshold:(CGFloat)screenSpaceAmbientOcclusionDepthThreshold
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionDepthThreshold:]();
    }
  }
  else
  {
    float v4 = screenSpaceAmbientOcclusionDepthThreshold;
    if (*(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) != v4)
    {
      *(&self->_screenSpaceAmbientOcclusion.normalThreshold + 1) = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __58__SCNCamera_setScreenSpaceAmbientOcclusionDepthThreshold___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"screenSpaceAmbientOcclusionDepthThreshold" applyBlock:v7];
    }
  }
}

void __58__SCNCamera_setScreenSpaceAmbientOcclusionDepthThreshold___block_invoke(uint64_t a1)
{
}

- (CGFloat)screenSpaceAmbientOcclusionNormalThreshold
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ScreenSpaceAmbientOcclusionNormalThreshold = C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetScreenSpaceAmbientOcclusionNormalThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount;
  }
  return ScreenSpaceAmbientOcclusionNormalThreshold;
}

- (void)setScreenSpaceAmbientOcclusionNormalThreshold:(CGFloat)screenSpaceAmbientOcclusionNormalThreshold
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionNormalThreshold:]();
    }
  }
  else
  {
    float v4 = screenSpaceAmbientOcclusionNormalThreshold;
    if (*(float *)&self->_screenSpaceAmbientOcclusion.sampleCount != v4)
    {
      *(float *)&self->_screenSpaceAmbientOcclusion.sampleCount = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __59__SCNCamera_setScreenSpaceAmbientOcclusionNormalThreshold___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"screenSpaceAmbientOcclusionNormalThreshold" applyBlock:v7];
    }
  }
}

void __59__SCNCamera_setScreenSpaceAmbientOcclusionNormalThreshold___block_invoke(uint64_t a1)
{
}

- (int64_t)screenSpaceAmbientOcclusionSampleCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_screenSpaceAmbientOcclusion.downSample;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  int64_t ScreenSpaceAmbientOcclusionSampleCount = (int)C3DCameraGetScreenSpaceAmbientOcclusionSampleCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ScreenSpaceAmbientOcclusionSampleCount;
}

- (void)setScreenSpaceAmbientOcclusionSampleCount:(int64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionSampleCount:]();
    }
  }
  else if (self->_screenSpaceAmbientOcclusion.downSample != a3)
  {
    self->_screenSpaceAmbientOcclusion.downSample = a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__SCNCamera_setScreenSpaceAmbientOcclusionSampleCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __55__SCNCamera_setScreenSpaceAmbientOcclusionSampleCount___block_invoke(uint64_t a1)
{
}

- (int64_t)screenSpaceAmbientOcclusionDownSample
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return (int64_t)self->_grainTexture;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return (int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  int64_t ScreenSpaceAmbientOcclusionDownSample = (int)C3DCameraGetScreenSpaceAmbientOcclusionDownSample((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ScreenSpaceAmbientOcclusionDownSample;
}

- (void)setScreenSpaceAmbientOcclusionDownSample:(int64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setScreenSpaceAmbientOcclusionDownSample:]();
    }
  }
  else if (self->_grainTexture != (MTLTexture *)a3)
  {
    self->_grainTexture = (MTLTexture *)a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__SCNCamera_setScreenSpaceAmbientOcclusionDownSample___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __54__SCNCamera_setScreenSpaceAmbientOcclusionDownSample___block_invoke(uint64_t a1)
{
}

- (BOOL)automaticallyAdjustsZRange
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char AutomaticallyAdjustsZRange = C3DCameraGetAutomaticallyAdjustsZRange((uint64_t)self->_camera);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = AutomaticallyAdjustsZRange;
    }
    else
    {
      camera = self->_camera;
      LOBYTE(v3) = C3DCameraGetAutomaticallyAdjustsZRange((uint64_t)camera);
    }
  }
  else
  {
    return (v2 >> 4) & 1;
  }
  return v3;
}

- (void)setAutomaticallyAdjustsZRange:(BOOL)automaticallyAdjustsZRange
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    float v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setAutomaticallyAdjustsZRange:]();
    }
  }
  else if (((((v4 & 0x10) == 0) ^ automaticallyAdjustsZRange) & 1) == 0)
  {
    if (automaticallyAdjustsZRange) {
      char v6 = 16;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 16) = v4 & 0xEF | v6;
    uint64_t v7 = [(SCNCamera *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__SCNCamera_setAutomaticallyAdjustsZRange___block_invoke;
    v9[3] = &unk_264004FE8;
    v9[4] = self;
    BOOL v10 = automaticallyAdjustsZRange;
    +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
  }
}

void __43__SCNCamera_setAutomaticallyAdjustsZRange___block_invoke(uint64_t a1)
{
}

- (CGFloat)averageGray
{
  if (*((unsigned char *)self + 16))
  {
    char v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float AverageGray = C3DCameraGetAverageGray((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetAverageGray((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_minimumExposure;
  }
  return AverageGray;
}

- (void)setAverageGray:(CGFloat)averageGray
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setAverageGray:]();
    }
  }
  else
  {
    float v4 = averageGray;
    if (self->_minimumExposure != v4)
    {
      self->_minimumExposure = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __28__SCNCamera_setAverageGray___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"averageGray" applyBlock:v7];
    }
  }
}

void __28__SCNCamera_setAverageGray___block_invoke(uint64_t a1)
{
}

- (CGFloat)bloomBlurRadius
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float BloomBlurRadius = C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomBlurRadius((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_vignettingPower;
  }
  return BloomBlurRadius;
}

- (void)setBloomBlurRadius:(CGFloat)bloomBlurRadius
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setBloomBlurRadius:]();
    }
  }
  else
  {
    float v4 = bloomBlurRadius;
    if (self->_vignettingPower != v4)
    {
      self->_vignettingPower = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setBloomBlurRadius___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"bloomBlurRadius" applyBlock:v7];
    }
  }
}

void __32__SCNCamera_setBloomBlurRadius___block_invoke(uint64_t a1)
{
}

- (CGFloat)bloomIntensity
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      *(float *)&int bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      *(float *)&int bloomIteration = C3DCameraGetBloomIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    int bloomIteration = self->_bloomIteration;
  }
  return *(float *)&bloomIteration;
}

- (void)setBloomIntensity:(CGFloat)bloomIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setBloomIntensity:]();
    }
  }
  else
  {
    *(float *)&int v4 = bloomIntensity;
    if (*(float *)&self->_bloomIteration != *(float *)&v4)
    {
      self->_int bloomIteration = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setBloomIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      int v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"bloomIntensity" applyBlock:v7];
    }
  }
}

void __31__SCNCamera_setBloomIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)bloomThreshold
{
  if (*((unsigned char *)self + 16))
  {
    int v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float BloomThreshold = C3DCameraGetBloomThreshold((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomThreshold((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_bloomIterationSpread;
  }
  return BloomThreshold;
}

- (void)setBloomThreshold:(CGFloat)bloomThreshold
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setBloomThreshold:]();
    }
  }
  else
  {
    float v4 = bloomThreshold;
    if (self->_bloomIterationSpread != v4)
    {
      self->_bloomIterationSpread = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setBloomThreshold___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"bloomThreshold" applyBlock:v7];
    }
  }
}

void __31__SCNCamera_setBloomThreshold___block_invoke(uint64_t a1)
{
}

- (NSInteger)bloomIterationCount
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      int BloomIteration = C3DCameraGetBloomIteration((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return (int)C3DCameraGetBloomIteration((uint64_t)self->_camera);
    }
  }
  else
  {
    return SLODWORD(self->_bloomBlurRadius);
  }
  return BloomIteration;
}

- (void)setBloomIterationCount:(NSInteger)bloomIterationCount
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setBloomIterationCount:]();
    }
  }
  else if (LODWORD(self->_bloomBlurRadius) != bloomIterationCount)
  {
    LODWORD(self->_bloomBlurRadius) = bloomIterationCount;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__SCNCamera_setBloomIterationCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = bloomIterationCount;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"bloomIteration" applyBlock:v7];
  }
}

void __36__SCNCamera_setBloomIterationCount___block_invoke(uint64_t a1)
{
}

- (CGFloat)bloomIterationSpread
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float BloomIterationSpread = C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetBloomIterationSpread((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_motionBlurIntensity;
  }
  return BloomIterationSpread;
}

- (void)setBloomIterationSpread:(CGFloat)bloomIterationSpread
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setBloomIterationSpread:]();
    }
  }
  else
  {
    float v4 = bloomIterationSpread;
    if (self->_motionBlurIntensity != v4)
    {
      self->_motionBlurIntensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __37__SCNCamera_setBloomIterationSpread___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"bloomIterationSpread" applyBlock:v7];
    }
  }
}

void __37__SCNCamera_setBloomIterationSpread___block_invoke(uint64_t a1)
{
}

- (NSUInteger)categoryBitMask
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(void *)&self->_projectionTransform.m11;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    NSUInteger CategoryBitMask = C3DCameraGetCategoryBitMask((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return CategoryBitMask;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetCategoryBitMask((uint64_t)camera);
  }
}

- (void)setCategoryBitMask:(NSUInteger)categoryBitMask
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setCategoryBitMask:]();
    }
  }
  else if (*(void *)&self->_projectionTransform.m11 != categoryBitMask)
  {
    *(void *)&self->_projectionTransform.m11 = categoryBitMask;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __32__SCNCamera_setCategoryBitMask___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = categoryBitMask;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __32__SCNCamera_setCategoryBitMask___block_invoke(uint64_t a1)
{
}

- (CGFloat)colorFringeStrength
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ColorFringeStrength = C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetColorFringeStrength((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_saturation;
  }
  return ColorFringeStrength;
}

- (void)setColorFringeStrength:(CGFloat)colorFringeStrength
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setColorFringeStrength:]();
    }
  }
  else
  {
    float v4 = colorFringeStrength;
    if (self->_saturation != v4)
    {
      self->_saturation = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setColorFringeStrength___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"colorFringeStrength" applyBlock:v7];
    }
  }
}

void __36__SCNCamera_setColorFringeStrength___block_invoke(uint64_t a1)
{
}

- (CGFloat)colorFringeIntensity
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ColorFringeIntensity = C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetColorFringeIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_contrast;
  }
  return ColorFringeIntensity;
}

- (void)setColorFringeIntensity:(CGFloat)colorFringeIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setColorFringeIntensity:]();
    }
  }
  else
  {
    float v4 = colorFringeIntensity;
    if (self->_contrast != v4)
    {
      self->_contrast = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __37__SCNCamera_setColorFringeIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"colorFringeIntensity" applyBlock:v7];
    }
  }
}

void __37__SCNCamera_setColorFringeIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)contrast
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float Contrast = C3DCameraGetContrast((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetContrast((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_grainScale;
  }
  return Contrast;
}

- (void)setContrast:(CGFloat)contrast
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setContrast:]();
    }
  }
  else
  {
    float v4 = contrast;
    if (self->_grainScale != v4)
    {
      self->_grainScale = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __25__SCNCamera_setContrast___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"contrast" applyBlock:v7];
    }
  }
}

void __25__SCNCamera_setContrast___block_invoke(uint64_t a1)
{
}

- (CGFloat)grainIntensity
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float GrainIntensity = C3DCameraGetGrainIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetGrainIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_grainIsColored;
  }
  return GrainIntensity;
}

- (void)setGrainIntensity:(CGFloat)grainIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setGrainIntensity:]();
    }
  }
  else
  {
    float v4 = grainIntensity;
    if (*(float *)&self->_grainIsColored != v4)
    {
      *(float *)&self->_grainIsColored = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setGrainIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"grainIntensity" applyBlock:v7];
    }
  }
}

void __31__SCNCamera_setGrainIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)grainScale
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float GrainScale = C3DCameraGetGrainScale((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetGrainScale((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_whiteBalanceTemperature;
  }
  return GrainScale;
}

- (void)setGrainScale:(CGFloat)grainScale
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setGrainScale:]();
    }
  }
  else
  {
    float v4 = grainScale;
    if (self->_whiteBalanceTemperature != v4)
    {
      self->_whiteBalanceTemperature = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setGrainScale___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"grainScale" applyBlock:v7];
    }
  }
}

void __27__SCNCamera_setGrainScale___block_invoke(uint64_t a1)
{
}

- (BOOL)grainIsColored
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return LOBYTE(self->_whiteBalanceTint);
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char IsColored = C3DCameraGetGrainIsColored((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return IsColored;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetGrainIsColored((uint64_t)camera);
  }
}

- (void)setGrainIsColored:(BOOL)grainIsColored
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setGrainIsColored:]();
    }
  }
  else if (LOBYTE(self->_whiteBalanceTint) != grainIsColored)
  {
    LOBYTE(self->_whiteBalanceTint) = grainIsColored;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __31__SCNCamera_setGrainIsColored___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = grainIsColored;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __31__SCNCamera_setGrainIsColored___block_invoke(uint64_t a1)
{
}

- (double)grainSlice
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ARGrainSlice = C3DCameraGetARGrainSlice((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetARGrainSlice((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self[1].super.isa;
  }
  return ARGrainSlice;
}

- (void)setGrainSlice:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setGrainSlice:]();
    }
  }
  else
  {
    float v4 = a3;
    if (*(float *)&self[1].super.isa != v4)
    {
      *(float *)&self[1].super.isa = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setGrainSlice___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:0 applyBlock:v7];
    }
  }
}

void __27__SCNCamera_setGrainSlice___block_invoke(uint64_t a1)
{
}

- (id)grainTexture
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(id *)&self->_grainSlice;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    ARGrainTexture = (void *)C3DCameraGetARGrainTexture((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return ARGrainTexture;
  }
  else
  {
    camera = self->_camera;
    return (id)C3DCameraGetARGrainTexture((uint64_t)camera);
  }
}

- (void)setGrainTexture:(id)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setGrainTexture:]();
    }
  }
  else
  {
    id v5 = *(id *)&self->_grainSlice;
    if (v5 != a3)
    {

      *(void *)&self->_grainSlice = a3;
      char v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __29__SCNCamera_setGrainTexture___block_invoke;
      v8[3] = &unk_264006160;
      v8[4] = self;
      v8[5] = a3;
      +[SCNTransaction postCommandWithContext:v6 object:self key:0 applyBlock:v8];
    }
  }
}

CFTypeRef __29__SCNCamera_setGrainTexture___block_invoke(uint64_t a1)
{
  return C3DCameraSetARGrainTexture(*(void *)(*(void *)(a1 + 32) + 8), *(CFTypeRef *)(a1 + 40));
}

- (CGFloat)whiteBalanceTemperature
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float WhiteBalanceTemperature = C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhiteBalanceTemperature((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(&self->_whiteBalanceTint + 1);
  }
  return WhiteBalanceTemperature;
}

- (void)setWhiteBalanceTemperature:(CGFloat)whiteBalanceTemperature
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setWhiteBalanceTemperature:]();
    }
  }
  else
  {
    float v4 = whiteBalanceTemperature;
    if (*(&self->_whiteBalanceTint + 1) != v4)
    {
      *(&self->_whiteBalanceTint + 1) = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __40__SCNCamera_setWhiteBalanceTemperature___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"whiteBalanceTemperature" applyBlock:v7];
    }
  }
}

void __40__SCNCamera_setWhiteBalanceTemperature___block_invoke(uint64_t a1)
{
}

- (CGFloat)whiteBalanceTint
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float WhiteBalanceTint = C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhiteBalanceTint((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_screenSpaceAmbientOcclusion.intensity;
  }
  return WhiteBalanceTint;
}

- (void)setWhiteBalanceTint:(CGFloat)whiteBalanceTint
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setWhiteBalanceTint:]();
    }
  }
  else
  {
    float v4 = whiteBalanceTint;
    if (self->_screenSpaceAmbientOcclusion.intensity != v4)
    {
      self->_screenSpaceAmbientOcclusion.intensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __33__SCNCamera_setWhiteBalanceTint___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"whiteBalanceTint" applyBlock:v7];
    }
  }
}

void __33__SCNCamera_setWhiteBalanceTint___block_invoke(uint64_t a1)
{
}

- (CGFloat)exposureAdaptationBrighteningSpeedFactor
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ExposureAdaptationBrighteningSpeedFactor = C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationBrighteningSpeedFactor((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_exposureAdaptationHistogramRangeHighProbability;
  }
  return ExposureAdaptationBrighteningSpeedFactor;
}

- (void)setExposureAdaptationBrighteningSpeedFactor:(CGFloat)exposureAdaptationBrighteningSpeedFactor
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationBrighteningSpeedFactor:]();
    }
  }
  else
  {
    float v4 = exposureAdaptationBrighteningSpeedFactor;
    if (*(float *)&self->_exposureAdaptationHistogramRangeHighProbability != v4)
    {
      *(float *)&self->_exposureAdaptationHistogramRangeHighProbability = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __57__SCNCamera_setExposureAdaptationBrighteningSpeedFactor___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureAdaptationBrighteningSpeedFactor" applyBlock:v7];
    }
  }
}

void __57__SCNCamera_setExposureAdaptationBrighteningSpeedFactor___block_invoke(uint64_t a1)
{
}

- (CGFloat)exposureAdaptationDarkeningSpeedFactor
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ExposureAdaptationDarkeningSpeedFactor = C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationDarkeningSpeedFactor((uint64_t)self->_camera);
    }
  }
  else
  {
    return *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1);
  }
  return ExposureAdaptationDarkeningSpeedFactor;
}

- (void)setExposureAdaptationDarkeningSpeedFactor:(CGFloat)exposureAdaptationDarkeningSpeedFactor
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationDarkeningSpeedFactor:]();
    }
  }
  else
  {
    float v4 = exposureAdaptationDarkeningSpeedFactor;
    if (*((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) != v4)
    {
      *((float *)&self->_exposureAdaptationHistogramRangeHighProbability + 1) = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __55__SCNCamera_setExposureAdaptationDarkeningSpeedFactor___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureAdaptationDarkeningSpeedFactor" applyBlock:v7];
    }
  }
}

void __55__SCNCamera_setExposureAdaptationDarkeningSpeedFactor___block_invoke(uint64_t a1)
{
}

- (double)exposureAdaptationDuration
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ExposureAdaptationDuration = C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureAdaptationDuration((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureAdaptationDarkeningSpeedFactor;
  }
  return ExposureAdaptationDuration;
}

- (void)setExposureAdaptationDuration:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationDuration:]();
    }
  }
  else
  {
    float v4 = a3;
    if (self->_exposureAdaptationDarkeningSpeedFactor != v4)
    {
      self->_exposureAdaptationDarkeningSpeedFactor = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __43__SCNCamera_setExposureAdaptationDuration___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureAdaptationDuration" applyBlock:v7];
    }
  }
}

void __43__SCNCamera_setExposureAdaptationDuration___block_invoke(uint64_t a1)
{
}

- (double)exposureAdaptationHistogramRangeHighProbability
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_exposureAdaptationHistogramRangeLowProbability;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ExposureAdaptationHistogramRangeHighProbability = C3DCameraGetExposureAdaptationHistogramRangeHighProbability((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationHistogramRangeHighProbability;
}

- (void)setExposureAdaptationHistogramRangeHighProbability:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationHistogramRangeHighProbability:]();
    }
  }
  else if (self->_exposureAdaptationHistogramRangeLowProbability != a3)
  {
    self->_exposureAdaptationHistogramRangeLowProbability = a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__SCNCamera_setExposureAdaptationHistogramRangeHighProbability___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureAdaptationHistogramRangeHighProbability" applyBlock:v7];
  }
}

float __64__SCNCamera_setExposureAdaptationHistogramRangeHighProbability___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DCameraSetExposureAdaptationHistogramRangeHighProbability(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (double)exposureAdaptationHistogramRangeLowProbability
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(double *)&self->_exposureAdaptationMode;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  double ExposureAdaptationHistogramRangeLowProbability = C3DCameraGetExposureAdaptationHistogramRangeLowProbability((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationHistogramRangeLowProbability;
}

- (void)setExposureAdaptationHistogramRangeLowProbability:(double)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationHistogramRangeLowProbability:]();
    }
  }
  else if (*(double *)&self->_exposureAdaptationMode != a3)
  {
    *(double *)&self->_exposureAdaptationMode = a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__SCNCamera_setExposureAdaptationHistogramRangeLowProbability___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    *(double *)&void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureAdaptationHistogramRangeLowProbability" applyBlock:v7];
  }
}

float __63__SCNCamera_setExposureAdaptationHistogramRangeLowProbability___block_invoke(uint64_t a1)
{
  float v1 = *(double *)(a1 + 40);
  C3DCameraSetExposureAdaptationHistogramRangeLowProbability(*(void *)(*(void *)(a1 + 32) + 8), v1);
  return result;
}

- (int64_t)exposureAdaptationMode
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(void *)&self->_bloomIntensity;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  int64_t ExposureAdaptationMode = C3DCameraGetExposureAdaptationMode((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return ExposureAdaptationMode;
}

- (void)setExposureAdaptationMode:(int64_t)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureAdaptationMode:]();
    }
  }
  else if (*(void *)&self->_bloomIntensity != a3)
  {
    *(void *)&self->_bloomIntensity = a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __39__SCNCamera_setExposureAdaptationMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __39__SCNCamera_setExposureAdaptationMode___block_invoke(uint64_t a1)
{
}

- (CGFloat)exposureOffset
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float ExposureOffset = C3DCameraGetExposureOffset((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetExposureOffset((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_maximumExposure;
  }
  return ExposureOffset;
}

- (void)setExposureOffset:(CGFloat)exposureOffset
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setExposureOffset:]();
    }
  }
  else
  {
    float v4 = exposureOffset;
    if (self->_maximumExposure != v4)
    {
      self->_maximumExposure = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __31__SCNCamera_setExposureOffset___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"exposureOffset" applyBlock:v7];
    }
  }
}

void __31__SCNCamera_setExposureOffset___block_invoke(uint64_t a1)
{
}

- (BOOL)wantsDepthOfField
{
  [(SCNCamera *)self dofIntensity];
  return v2 > 0.0;
}

- (void)setWantsDepthOfField:(BOOL)wantsDepthOfField
{
  double v3 = 0.0;
  if (wantsDepthOfField) {
    *(float *)&double v3 = 1.0;
  }
  [(SCNCamera *)self setDofIntensity:v3];
}

- (float)dofIntensity
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(float *)&self->_bladeCount;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    float DepthOfFieldIntensity = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return DepthOfFieldIntensity;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetDepthOfFieldIntensity((uint64_t)camera);
  }
}

- (void)setDofIntensity:(float)a3
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setDofIntensity:]();
    }
  }
  else if (*(float *)&self->_bladeCount != a3)
  {
    *(float *)&self->_bladeCount = a3;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __29__SCNCamera_setDofIntensity___block_invoke;
    v7[3] = &unk_264009038;
    v7[4] = self;
    float v8 = a3;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"dofIntensity" applyBlock:v7];
  }
}

void __29__SCNCamera_setDofIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)focalBlurRadius
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float DepthOfFieldIntensity = C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetDepthOfFieldIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_bladeCount;
  }
  return DepthOfFieldIntensity;
}

- (CGFloat)maximumExposure
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float MaximumExposure = C3DCameraGetMaximumExposure((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMaximumExposure((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureAdaptationDuration;
  }
  return MaximumExposure;
}

- (void)setMaximumExposure:(CGFloat)maximumExposure
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setMaximumExposure:]();
    }
  }
  else
  {
    float v4 = maximumExposure;
    if (self->_exposureAdaptationDuration != v4)
    {
      self->_exposureAdaptationDuration = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setMaximumExposure___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"maximumExposure" applyBlock:v7];
    }
  }
}

void __32__SCNCamera_setMaximumExposure___block_invoke(uint64_t a1)
{
}

- (CGFloat)minimumExposure
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float MinimumExposure = C3DCameraGetMinimumExposure((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMinimumExposure((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_wantsExposureAdaptation;
  }
  return MinimumExposure;
}

- (void)setMinimumExposure:(CGFloat)minimumExposure
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setMinimumExposure:]();
    }
  }
  else
  {
    float v4 = minimumExposure;
    if (*(float *)&self->_wantsExposureAdaptation != v4)
    {
      *(float *)&self->_wantsExposureAdaptation = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setMinimumExposure___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"minimumExposure" applyBlock:v7];
    }
  }
}

void __32__SCNCamera_setMinimumExposure___block_invoke(uint64_t a1)
{
}

- (CGFloat)motionBlurIntensity
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float MotionBlurIntensity = C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetMotionBlurIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_vignettingIntensity;
  }
  return MotionBlurIntensity;
}

- (void)setMotionBlurIntensity:(CGFloat)motionBlurIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setMotionBlurIntensity:]();
    }
  }
  else
  {
    float v4 = motionBlurIntensity;
    if (self->_vignettingIntensity != v4)
    {
      self->_vignettingIntensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setMotionBlurIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"motionBlurIntensity" applyBlock:v7];
    }
  }
}

void __36__SCNCamera_setMotionBlurIntensity___block_invoke(uint64_t a1)
{
}

- (double)orthographicScale
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_orthographicScale;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double OrthographicScale = C3DCameraGetOrthographicScale((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return OrthographicScale;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetOrthographicScale((uint64_t)camera);
  }
}

- (void)setOrthographicScale:(double)orthographicScale
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setOrthographicScale:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) &= ~2u;
    if (self->_orthographicScale != orthographicScale)
    {
      self->_orthographicScale = orthographicScale;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __34__SCNCamera_setOrthographicScale___block_invoke;
      v7[3] = &unk_264004FC0;
      v7[4] = self;
      *(double *)&void v7[5] = orthographicScale;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"orthographicScale" applyBlock:v7];
    }
  }
}

void __34__SCNCamera_setOrthographicScale___block_invoke(uint64_t a1)
{
}

- (CGFloat)saturation
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float Saturation = C3DCameraGetSaturation((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetSaturation((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_grainIntensity;
  }
  return Saturation;
}

- (void)setSaturation:(CGFloat)saturation
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setSaturation:]();
    }
  }
  else
  {
    float v4 = saturation;
    if (self->_grainIntensity != v4)
    {
      self->_grainIntensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setSaturation___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"saturation" applyBlock:v7];
    }
  }
}

void __27__SCNCamera_setSaturation___block_invoke(uint64_t a1)
{
}

- (BOOL)usesOrthographicProjection
{
  unsigned int v2 = *((unsigned __int8 *)self + 16);
  if (v2)
  {
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    if (v5)
    {
      uint64_t v6 = (uint64_t)v5;
      C3DSceneLock((uint64_t)v5);
      char UsesOrthographicProjection = C3DCameraGetUsesOrthographicProjection((uint64_t)self->_camera);
      C3DSceneUnlock(v6);
      LOBYTE(v3) = UsesOrthographicProjection;
    }
    else
    {
      camera = self->_camera;
      LOBYTE(v3) = C3DCameraGetUsesOrthographicProjection((uint64_t)camera);
    }
  }
  else
  {
    return (v2 >> 3) & 1;
  }
  return v3;
}

- (void)setUsesOrthographicProjection:(BOOL)usesOrthographicProjection
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    float v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setUsesOrthographicProjection:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v4 & 0xFD;
    if (((((v4 & 8) == 0) ^ usesOrthographicProjection) & 1) == 0)
    {
      if (usesOrthographicProjection) {
        char v6 = 8;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 16) = v4 & 0xF5 | v6;
      uint64_t v7 = [(SCNCamera *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __43__SCNCamera_setUsesOrthographicProjection___block_invoke;
      v9[3] = &unk_264004FE8;
      v9[4] = self;
      BOOL v10 = usesOrthographicProjection;
      +[SCNTransaction postCommandWithContext:v7 object:self applyBlock:v9];
    }
  }
}

void __43__SCNCamera_setUsesOrthographicProjection___block_invoke(uint64_t a1)
{
}

- (CGFloat)vignettingIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float VignettingIntensity = C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetVignettingIntensity((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_colorFringeIntensity;
  }
  return VignettingIntensity;
}

- (void)setVignettingIntensity:(CGFloat)vignettingIntensity
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setVignettingIntensity:]();
    }
  }
  else
  {
    float v4 = vignettingIntensity;
    if (self->_colorFringeIntensity != v4)
    {
      self->_colorFringeIntensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __36__SCNCamera_setVignettingIntensity___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"vignettingIntensity" applyBlock:v7];
    }
  }
}

void __36__SCNCamera_setVignettingIntensity___block_invoke(uint64_t a1)
{
}

- (CGFloat)vignettingPower
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float VignettingPower = C3DCameraGetVignettingPower((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetVignettingPower((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_colorFringeStrength;
  }
  return VignettingPower;
}

- (void)setVignettingPower:(CGFloat)vignettingPower
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setVignettingPower:]();
    }
  }
  else
  {
    float v4 = vignettingPower;
    if (self->_colorFringeStrength != v4)
    {
      self->_colorFringeStrength = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __32__SCNCamera_setVignettingPower___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"vignettingPower" applyBlock:v7];
    }
  }
}

void __32__SCNCamera_setVignettingPower___block_invoke(uint64_t a1)
{
}

- (BOOL)wantsExposureAdaptation
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor);
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char WantsExposureAdaptation = C3DCameraGetWantsExposureAdaptation((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return WantsExposureAdaptation;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetWantsExposureAdaptation((uint64_t)camera);
  }
}

- (void)setWantsExposureAdaptation:(BOOL)wantsExposureAdaptation
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setWantsExposureAdaptation:]();
    }
  }
  else if (LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) != wantsExposureAdaptation)
  {
    LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) = wantsExposureAdaptation;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __40__SCNCamera_setWantsExposureAdaptation___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = wantsExposureAdaptation;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __40__SCNCamera_setWantsExposureAdaptation___block_invoke(uint64_t a1)
{
}

- (BOOL)wantsHDR
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return LOBYTE(self->_averageGray);
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    char WantsHDR = C3DCameraGetWantsHDR((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return WantsHDR;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetWantsHDR((uint64_t)camera);
  }
}

- (void)setWantsHDR:(BOOL)wantsHDR
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setWantsHDR:]();
    }
  }
  else if (LOBYTE(self->_averageGray) != wantsHDR)
  {
    LOBYTE(self->_averageGray) = wantsHDR;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__SCNCamera_setWantsHDR___block_invoke;
    v7[3] = &unk_264004FE8;
    v7[4] = self;
    BOOL v8 = wantsHDR;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __25__SCNCamera_setWantsHDR___block_invoke(uint64_t a1)
{
}

- (CGFloat)whitePoint
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float WhitePoint = C3DCameraGetWhitePoint((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetWhitePoint((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_exposureOffset;
  }
  return WhitePoint;
}

- (void)setWhitePoint:(CGFloat)whitePoint
{
  if (*((unsigned char *)self + 16))
  {
    char v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setWhitePoint:]();
    }
  }
  else
  {
    float v4 = whitePoint;
    if (self->_exposureOffset != v4)
    {
      self->_exposureOffset = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __27__SCNCamera_setWhitePoint___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"whitePoint" applyBlock:v7];
    }
  }
}

void __27__SCNCamera_setWhitePoint___block_invoke(uint64_t a1)
{
}

- (double)xFov
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_xFov;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double XFov = C3DCameraGetXFov((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return XFov;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetXFov((uint64_t)camera);
  }
}

- (void)setXFov:(double)xFov
{
  if (*((unsigned char *)self + 16))
  {
    float v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setXFov:]();
    }
  }
  else
  {
    if (xFov >= 1.0e-35) {
      double v4 = xFov;
    }
    else {
      double v4 = 0.0;
    }
    char v5 = *((unsigned char *)self + 16) & 0xF9;
    *((unsigned char *)self + 16) = v5 | 4;
    if (v4 != self->_xFov)
    {
      float v6 = v4;
      self->_xfloat Fov = v6;
      if (v6 != 0.0)
      {
        *((unsigned char *)self + 16) = v5 | 0x44;
        self->_fieldOfView = v6;
        [(SCNCamera *)self _updateFocalLength];
      }
      uint64_t v7 = [(SCNCamera *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __21__SCNCamera_setXFov___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      *(double *)&void v9[5] = v4;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"xFov" applyBlock:v9];
    }
  }
}

void __21__SCNCamera_setXFov___block_invoke(uint64_t a1)
{
}

- (double)yFov
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_yFov;
  }
  double v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    Yfloat Fov = C3DCameraGetYFov((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return YFov;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetYFov((uint64_t)camera);
  }
}

- (void)setYFov:(double)yFov
{
  if (*((unsigned char *)self + 16))
  {
    float v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setYFov:]();
    }
  }
  else
  {
    if (yFov >= 1.0e-35) {
      double v4 = yFov;
    }
    else {
      double v4 = 0.0;
    }
    char v5 = *((unsigned char *)self + 16) & 0xF9 | 4;
    *((unsigned char *)self + 16) = v5;
    if (v4 != self->_yFov)
    {
      float v6 = v4;
      self->_yfloat Fov = v6;
      if (v6 != 0.0)
      {
        *((unsigned char *)self + 16) = v5 & 0xBD;
        self->_fieldOfView = v6;
        [(SCNCamera *)self _updateFocalLength];
      }
      uint64_t v7 = [(SCNCamera *)self sceneRef];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __21__SCNCamera_setYFov___block_invoke;
      v9[3] = &unk_264004FC0;
      v9[4] = self;
      *(double *)&void v9[5] = v4;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"yFov" applyBlock:v9];
    }
  }
}

void __21__SCNCamera_setYFov___block_invoke(uint64_t a1)
{
}

- (double)zFar
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zFar;
  }
  double v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double ZFar = C3DCameraGetZFar((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return ZFar;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetZFar((uint64_t)camera);
  }
}

- (void)setZFar:(double)zFar
{
  if (*((unsigned char *)self + 16))
  {
    float v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setZFar:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) &= ~2u;
    if (self->_zFar != zFar)
    {
      self->_zFar = zFar;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __21__SCNCamera_setZFar___block_invoke;
      v7[3] = &unk_264004FC0;
      v7[4] = self;
      *(double *)&void v7[5] = zFar;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"zFar" applyBlock:v7];
    }
  }
}

void __21__SCNCamera_setZFar___block_invoke(uint64_t a1)
{
}

- (double)zNear
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_zNear;
  }
  double v4 = [(SCNCamera *)self sceneRef];
  if (v4)
  {
    uint64_t v5 = (uint64_t)v4;
    C3DSceneLock((uint64_t)v4);
    double ZNear = C3DCameraGetZNear((uint64_t)self->_camera);
    C3DSceneUnlock(v5);
    return ZNear;
  }
  else
  {
    camera = self->_camera;
    return C3DCameraGetZNear((uint64_t)camera);
  }
}

- (void)setZNear:(double)zNear
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    BOOL v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setZNear:]();
    }
  }
  else
  {
    double v5 = zNear;
    *((unsigned char *)self + 16) = v4 & 0xFD;
    int v6 = v4 & 8;
    if (zNear == 0.0 && v6 == 0)
    {
      float v8 = scn_default_log();
      double v5 = 0.0001;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v13 = self;
        _os_log_impl(&dword_20B249000, v8, OS_LOG_TYPE_DEFAULT, "Warning: %@: zNear of 0 is not allowed", buf, 0xCu);
      }
    }
    if (v5 != self->_zNear)
    {
      self->_zNear = v5;
      uint64_t v9 = [(SCNCamera *)self sceneRef];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __22__SCNCamera_setZNear___block_invoke;
      v11[3] = &unk_264004FC0;
      v11[4] = self;
      *(double *)&v11[5] = v5;
      +[SCNTransaction postCommandWithContext:v9 object:self key:@"zNear" applyBlock:v11];
    }
  }
}

void __22__SCNCamera_setZNear___block_invoke(uint64_t a1)
{
}

- (double)lensShift
{
  if ((*(unsigned char *)(a1 + 16) & 1) == 0) {
    return *(double *)(a1 + 96);
  }
  uint64_t v3 = [(id)a1 sceneRef];
  if (v3)
  {
    uint64_t v4 = v3;
    C3DSceneLock(v3);
    double LensShift = C3DCameraGetLensShift(*(void *)(a1 + 8));
    C3DSceneUnlock(v4);
    return LensShift;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 8);
    return C3DCameraGetLensShift(v6);
  }
}

- (void)setLensShift:(SCNCamera *)self
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setLensShift:]();
    }
  }
  else
  {
    float32x2_t v4 = v2;
    uint32x2_t v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_lensShift[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_lensShift[4] = v4;
      uint64_t v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __26__SCNCamera_setLensShift___block_invoke;
      v8[3] = &unk_264004FC0;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"lensShift" applyBlock:v8];
    }
  }
}

void __26__SCNCamera_setLensShift___block_invoke(uint64_t a1)
{
}

- (CGAffineTransform)postProjectionTransform
{
  uint64_t v3 = self;
  uint64_t v5 = MEMORY[0x263F000D0];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->CGFloat c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  if (LOBYTE(self->c))
  {
    uint64_t v9 = [(CGAffineTransform *)self sceneRef];
    uint64_t v10 = v9;
    if (v9) {
      C3DSceneLock(v9);
    }
    double PostProjectionTransformTranslation = C3DCameraGetPostProjectionTransformTranslation(*(void *)&v3->b);
    double PostProjectionTransformScale = C3DCameraGetPostProjectionTransformScale(*(void *)&v3->b);
    retstr->ty = *((float *)&PostProjectionTransformTranslation + 1);
    retstr->a = *(float *)&PostProjectionTransformScale;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&PostProjectionTransformScale, *(int8x8_t *)&PostProjectionTransformTranslation, 4uLL));
    if (v10)
    {
      return (CGAffineTransform *)C3DSceneUnlock(v10);
    }
  }
  else
  {
    CGFloat b = self[2].b;
    CGFloat c = self[2].c;
    retstr->ty = *((float *)&b + 1);
    retstr->a = *(float *)&c;
    *(float64x2_t *)&retstr->d = vcvtq_f64_f32((float32x2_t)vext_s8(*(int8x8_t *)&c, *(int8x8_t *)&b, 4uLL));
  }
  return self;
}

- (void)setPostProjectionTransform:(CGAffineTransform *)a3
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setPostProjectionTransform:]();
    }
  }
  else
  {
    float32x2_t v4 = vcvt_f32_f64(*(float64x2_t *)&a3->tx);
    v5.f64[0] = a3->a;
    v5.f64[1] = a3->d;
    float32x2_t v6 = vcvt_f32_f64(v5);
    *(int8x8_t *)&v5.f64[0] = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v4));
    if ((vpmax_u32(*(uint32x2_t *)&v5.f64[0], *(uint32x2_t *)&v5.f64[0]).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v4;
      uint64_t v7 = [(SCNCamera *)self sceneRef];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __40__SCNCamera_setPostProjectionTransform___block_invoke;
      v12[3] = &unk_264004FC0;
      v12[4] = self;
      v12[5] = v4;
      +[SCNTransaction postCommandWithContext:v7 object:self key:@"postProjectionTransformTranslation" applyBlock:v12];
    }
    uint32x2_t v8 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v6));
    if ((vpmax_u32(v8, v8).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformScale[4] = v6;
      uint64_t v9 = [(SCNCamera *)self sceneRef];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __40__SCNCamera_setPostProjectionTransform___block_invoke_2;
      v11[3] = &unk_264004FC0;
      v11[4] = self;
      v11[5] = v6;
      +[SCNTransaction postCommandWithContext:v9 object:self key:@"postProjectionTransformScale" applyBlock:v11];
    }
  }
}

void __40__SCNCamera_setPostProjectionTransform___block_invoke(uint64_t a1)
{
}

void __40__SCNCamera_setPostProjectionTransform___block_invoke_2(uint64_t a1)
{
}

- (void)setPostProjectionTransformTranslation:(SCNCamera *)self
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setPostProjectionTransformTranslation:]();
    }
  }
  else
  {
    float32x2_t v4 = v2;
    uint32x2_t v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformTranslation[4] = v4;
      float32x2_t v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __51__SCNCamera_setPostProjectionTransformTranslation___block_invoke;
      v8[3] = &unk_264004FC0;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"postProjectionTransformTranslation" applyBlock:v8];
    }
  }
}

void __51__SCNCamera_setPostProjectionTransformTranslation___block_invoke(uint64_t a1)
{
}

- (void)setPostProjectionTransformScale:(SCNCamera *)self
{
  if (*((unsigned char *)self + 16))
  {
    uint64_t v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setPostProjectionTransformScale:]();
    }
  }
  else
  {
    float32x2_t v4 = v2;
    uint32x2_t v5 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], v2));
    if ((vpmax_u32(v5, v5).u32[0] & 0x80000000) != 0)
    {
      *(float32x2_t *)&self->_postProjectionTransformScale[4] = v4;
      float32x2_t v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __45__SCNCamera_setPostProjectionTransformScale___block_invoke;
      v8[3] = &unk_264004FC0;
      v8[4] = self;
      v8[5] = v4;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"postProjectionTransformScale" applyBlock:v8];
    }
  }
}

void __45__SCNCamera_setPostProjectionTransformScale___block_invoke(uint64_t a1)
{
}

- (void)_updateFieldOfView
{
  float focalLength = self->_focalLength;
  if (focalLength <= 0.0)
  {
    double v5 = 3.14159274;
  }
  else
  {
    long double v4 = atan(self->_sensorSize * 0.5 / focalLength);
    *(float *)&long double v4 = v4 + v4;
    double v5 = *(float *)&v4;
  }
  float v6 = v5 / 3.14159265 * 180.0;
  self->_fieldOfView = v6;
  *((unsigned char *)self + 16) &= ~4u;
}

- (void)_checkSettingsConsistency
{
}

+ (id)keyPathsForValuesAffectingFieldOfView
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"focalLength", @"sensorHeight", 0);
}

+ (id)keyPathsForValuesAffectingFocalLength
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"fieldOfView", 0);
}

- (CGFloat)fieldOfView
{
  if (*((unsigned char *)self + 16))
  {
    long double v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float Fov = C3DCameraGetFov((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFov((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_fieldOfView;
  }
  return Fov;
}

- (void)setFieldOfView:(CGFloat)fieldOfView
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    uint64_t v9 = scn_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setFieldOfView:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v4 & 0xFD;
    float v5 = fieldOfView;
    if ((v4 & 4) != 0 || self->_fieldOfView != v5)
    {
      self->_fieldOfView = v5;
      *((unsigned char *)self + 16) = v4 & 0xF9;
      float v6 = 0.0;
      if ((v4 & 0x40) != 0) {
        float v7 = 0.0;
      }
      else {
        float v7 = v5;
      }
      if ((v4 & 0x40) != 0) {
        float v6 = v5;
      }
      self->_xfloat Fov = v6;
      self->_yfloat Fov = v7;
      [(SCNCamera *)self _updateFocalLength];
      uint32x2_t v8 = [(SCNCamera *)self sceneRef];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __28__SCNCamera_setFieldOfView___block_invoke;
      v10[3] = &unk_264009038;
      v10[4] = self;
      float v11 = v5;
      +[SCNTransaction postCommandWithContext:v8 object:self key:@"fieldOfView" applyBlock:v10];
    }
  }
}

float __28__SCNCamera_setFieldOfView___block_invoke(uint64_t a1)
{
  return C3DCameraSetFov(*(void *)(*(void *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)sensorHeight
{
  if (*((unsigned char *)self + 16))
  {
    char v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float SensorSize = C3DCameraGetSensorSize((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetSensorSize((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_sensorSize;
  }
  return SensorSize;
}

- (void)setSensorHeight:(CGFloat)sensorHeight
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setSensorHeight:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v4 & 0xFD;
    float v5 = sensorHeight;
    if ((v4 & 4) != 0 || self->_sensorSize != v5)
    {
      self->_sensorSize = v5;
      [(SCNCamera *)self _updateFieldOfView];
      float v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __29__SCNCamera_setSensorHeight___block_invoke;
      v8[3] = &unk_264009038;
      v8[4] = self;
      float v9 = v5;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"sensorHeight" applyBlock:v8];
    }
  }
}

float __29__SCNCamera_setSensorHeight___block_invoke(uint64_t a1)
{
  return C3DCameraSetSensorSize(*(void *)(*(void *)(a1 + 32) + 8), *(float *)(a1 + 40));
}

- (CGFloat)focalLength
{
  if (*((unsigned char *)self + 16))
  {
    char v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float FocalLength = C3DCameraGetFocalLength((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFocalLength((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_focalLength;
  }
  return FocalLength;
}

- (void)setFocalLength:(CGFloat)focalLength
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    float v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setFocalLength:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v4 & 0xFD;
    float v5 = focalLength;
    if ((v4 & 4) != 0 || self->_focalLength != v5)
    {
      self->_float focalLength = v5;
      [(SCNCamera *)self _updateFieldOfView];
      float v6 = [(SCNCamera *)self sceneRef];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __28__SCNCamera_setFocalLength___block_invoke;
      v8[3] = &unk_264009038;
      v8[4] = self;
      float v9 = v5;
      +[SCNTransaction postCommandWithContext:v6 object:self key:@"focalLength" applyBlock:v8];
    }
  }
}

void __28__SCNCamera_setFocalLength___block_invoke(uint64_t a1)
{
}

- (CGFloat)aperture
{
  [(SCNCamera *)self sensorHeight];
  double v4 = v3;
  [(SCNCamera *)self fStop];
  return v4 / v5;
}

- (void)setAperture:(CGFloat)aperture
{
  [(SCNCamera *)self sensorHeight];
  double v6 = v5 / aperture;

  [(SCNCamera *)self setFStop:v6];
}

- (CGFloat)fStop
{
  if (*((unsigned char *)self + 16))
  {
    double v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float FStop = C3DCameraGetFStop((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFStop((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_focusDistance;
  }
  return FStop;
}

- (void)setFStop:(CGFloat)fStop
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setFStop:]();
    }
  }
  else
  {
    float v4 = fStop;
    if (self->_focusDistance != v4)
    {
      self->_focusDistance = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __22__SCNCamera_setFStop___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"fStop" applyBlock:v7];
    }
  }
}

void __22__SCNCamera_setFStop___block_invoke(uint64_t a1)
{
}

- (NSInteger)apertureBladeCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return self->_focalBlurSampleCount;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  NSInteger BladeCount = (int)C3DCameraGetBladeCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return BladeCount;
}

- (void)setApertureBladeCount:(NSInteger)apertureBladeCount
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setApertureBladeCount:]();
    }
  }
  else if (self->_focalBlurSampleCount != apertureBladeCount)
  {
    self->_focalBlurSampleCount = apertureBladeCount;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__SCNCamera_setApertureBladeCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = apertureBladeCount;
    +[SCNTransaction postCommandWithContext:v5 object:self key:@"apertureBladeCount" applyBlock:v7];
  }
}

void __35__SCNCamera_setApertureBladeCount___block_invoke(uint64_t a1)
{
}

- (NSInteger)focalBlurSampleCount
{
  if ((*((unsigned char *)self + 16) & 1) == 0) {
    return *(void *)&self->_aspectRatio;
  }
  float v4 = [(SCNCamera *)self sceneRef];
  if (!v4) {
    return (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  }
  uint64_t v5 = (uint64_t)v4;
  C3DSceneLock((uint64_t)v4);
  NSInteger DofSampleCount = (int)C3DCameraGetDofSampleCount((uint64_t)self->_camera);
  C3DSceneUnlock(v5);
  return DofSampleCount;
}

- (void)setFocalBlurSampleCount:(NSInteger)focalBlurSampleCount
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setFocalBlurSampleCount:]();
    }
  }
  else if (*(void *)&self->_aspectRatio != focalBlurSampleCount)
  {
    *(void *)&self->_aspectRatio = focalBlurSampleCount;
    uint64_t v5 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __37__SCNCamera_setFocalBlurSampleCount___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = focalBlurSampleCount;
    +[SCNTransaction postCommandWithContext:v5 object:self applyBlock:v7];
  }
}

void __37__SCNCamera_setFocalBlurSampleCount___block_invoke(uint64_t a1)
{
}

- (CGFloat)focusDistance
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float FocusDistance = C3DCameraGetFocusDistance((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetFocusDistance((uint64_t)self->_camera);
    }
  }
  else
  {
    return self->_dofIntensity;
  }
  return FocusDistance;
}

- (void)setFocusDistance:(CGFloat)focusDistance
{
  if (*((unsigned char *)self + 16))
  {
    double v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setFocusDistance:]();
    }
  }
  else
  {
    float v4 = focusDistance;
    if (self->_dofIntensity != v4)
    {
      self->_dofIntensity = v4;
      uint64_t v5 = [(SCNCamera *)self sceneRef];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __30__SCNCamera_setFocusDistance___block_invoke;
      v7[3] = &unk_264009038;
      v7[4] = self;
      float v8 = v4;
      +[SCNTransaction postCommandWithContext:v5 object:self key:@"focusDistance" applyBlock:v7];
    }
  }
}

void __30__SCNCamera_setFocusDistance___block_invoke(uint64_t a1)
{
}

- (int64_t)fillMode
{
  unint64_t v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) == 0) {
    return (v2 >> 5) & 1;
  }
  uint64_t v5 = [(SCNCamera *)self sceneRef];
  if (!v5) {
    return C3DCameraGetLetterboxMode((uint64_t)self->_camera);
  }
  uint64_t v6 = (uint64_t)v5;
  C3DSceneLock((uint64_t)v5);
  int64_t LetterboxMode = C3DCameraGetLetterboxMode((uint64_t)self->_camera);
  C3DSceneUnlock(v6);
  return LetterboxMode;
}

- (void)setFillMode:(int64_t)a3
{
  unint64_t v3 = *((unsigned __int8 *)self + 16);
  *((unsigned char *)self + 16) = v3 & 0xFB;
  if (((v3 >> 5) & 1) != a3)
  {
    *((unsigned char *)self + 16) = v3 & 0xDB | (32 * (a3 & 1));
    uint64_t v6 = [(SCNCamera *)self sceneRef];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__SCNCamera_setFillMode___block_invoke;
    v7[3] = &unk_264004FC0;
    v7[4] = self;
    void v7[5] = a3;
    +[SCNTransaction postCommandWithContext:v6 object:self applyBlock:v7];
  }
}

void __25__SCNCamera_setFillMode___block_invoke(uint64_t a1)
{
  C3DCameraSetLetterboxMode(*(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40) == 1);
}

- (SCNCameraProjectionDirection)projectionDirection
{
  unint64_t v2 = *((unsigned __int8 *)self + 16);
  if ((v2 & 1) == 0) {
    return (v2 >> 6) & 1;
  }
  uint64_t v5 = [(SCNCamera *)self sceneRef];
  if (!v5) {
    return (unint64_t)C3DCameraGetFovIsHorizontal((uint64_t)self->_camera);
  }
  uint64_t v6 = (uint64_t)v5;
  C3DSceneLock((uint64_t)v5);
  SCNCameraProjectionDirection IsHorizontal = (unint64_t)C3DCameraGetFovIsHorizontal((uint64_t)self->_camera);
  C3DSceneUnlock(v6);
  return IsHorizontal;
}

- (void)setProjectionDirection:(SCNCameraProjectionDirection)projectionDirection
{
  unint64_t v3 = *((unsigned __int8 *)self + 16);
  if (((v3 >> 6) & 1) != projectionDirection)
  {
    *((unsigned char *)self + 16) = v3 & 0xBF | ((projectionDirection & 1) << 6);
    float fieldOfView = self->_fieldOfView;
    if (projectionDirection) {
      float v7 = 0.0;
    }
    else {
      float v7 = self->_fieldOfView;
    }
    if ((projectionDirection & 1) == 0) {
      float fieldOfView = 0.0;
    }
    self->_xfloat Fov = fieldOfView;
    self->_yfloat Fov = v7;
    float v8 = [(SCNCamera *)self sceneRef];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__SCNCamera_setProjectionDirection___block_invoke;
    v9[3] = &unk_264004FC0;
    v9[4] = self;
    void v9[5] = projectionDirection;
    +[SCNTransaction postCommandWithContext:v8 object:self applyBlock:v9];
  }
}

void __36__SCNCamera_setProjectionDirection___block_invoke(uint64_t a1)
{
  C3DCameraSetFovHorizontal(*(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40) == 1);
}

- (double)aspectRatio
{
  if (*((unsigned char *)self + 16))
  {
    float v4 = [(SCNCamera *)self sceneRef];
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      C3DSceneLock((uint64_t)v4);
      float AspectRatio = C3DCameraGetAspectRatio((uint64_t)self->_camera);
      C3DSceneUnlock(v5);
    }
    else
    {
      return C3DCameraGetAspectRatio((uint64_t)self->_camera);
    }
  }
  else
  {
    return *(float *)&self->_categoryBitMask;
  }
  return AspectRatio;
}

- (void)setAspectRatio:(double)a3
{
  char v3 = *((unsigned char *)self + 16);
  if (*(float *)&self->_categoryBitMask != a3 || (v3 & 4) != 0)
  {
    *((unsigned char *)self + 16) = v3 & 0xFB;
    float v6 = a3;
    *(float *)&self->_categoryBitMask = v6;
    float v7 = [(SCNCamera *)self sceneRef];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __28__SCNCamera_setAspectRatio___block_invoke;
    v8[3] = &unk_264005010;
    v8[4] = self;
    +[SCNTransaction postCommandWithContext:v7 object:self key:@"aspectRatio" applyBlock:v8];
  }
}

double __28__SCNCamera_setAspectRatio___block_invoke(uint64_t a1)
{
  return C3DCameraSetAspectRatio(*(void *)(*(void *)(a1 + 32) + 8), *(float *)(*(void *)(a1 + 32) + 152));
}

- (BOOL)useLegacyFov
{
  return (*((unsigned __int8 *)self + 16) >> 2) & 1;
}

- (void)setProjectionTransform:(SCNMatrix4 *)projectionTransform
{
  char v4 = *((unsigned char *)self + 16);
  if (v4)
  {
    CFDictionaryRef v16 = scn_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SCNCamera setProjectionTransform:]();
    }
  }
  else
  {
    *((unsigned char *)self + 16) = v4 | 2;
    if ((v4 & 2) == 0) {
      goto LABEL_4;
    }
    long long v6 = *(_OWORD *)&projectionTransform->m21;
    *(_OWORD *)&a.m11 = *(_OWORD *)&projectionTransform->m11;
    *(_OWORD *)&a.m21 = v6;
    long long v7 = *(_OWORD *)&projectionTransform->m41;
    *(_OWORD *)&a.m31 = *(_OWORD *)&projectionTransform->m31;
    *(_OWORD *)&a.m41 = v7;
    long long v8 = *(_OWORD *)&self->_projectionTransform.m23;
    *(_OWORD *)&b.m11 = *(_OWORD *)&self->_projectionTransform.m13;
    *(_OWORD *)&b.m21 = v8;
    long long v9 = *(_OWORD *)&self->_projectionTransform.m43;
    *(_OWORD *)&b.m31 = *(_OWORD *)&self->_projectionTransform.m33;
    *(_OWORD *)&b.m41 = v9;
    if (!SCNMatrix4EqualToMatrix4(&a, &b))
    {
LABEL_4:
      long long v10 = *(_OWORD *)&projectionTransform->m11;
      long long v11 = *(_OWORD *)&projectionTransform->m21;
      long long v12 = *(_OWORD *)&projectionTransform->m31;
      *(_OWORD *)&self->_projectionTransform.m43 = *(_OWORD *)&projectionTransform->m41;
      *(_OWORD *)&self->_projectionTransform.m33 = v12;
      *(_OWORD *)&self->_projectionTransform.m23 = v11;
      *(_OWORD *)&self->_projectionTransform.m13 = v10;
      double v13 = [(SCNCamera *)self sceneRef];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      long long v14 = *(_OWORD *)&projectionTransform->m21;
      long long v18 = *(_OWORD *)&projectionTransform->m11;
      long long v19 = v14;
      long long v15 = *(_OWORD *)&projectionTransform->m41;
      long long v20 = *(_OWORD *)&projectionTransform->m31;
      long long v21 = v15;
      v17[2] = __36__SCNCamera_setProjectionTransform___block_invoke;
      v17[3] = &unk_264007B18;
      v17[4] = self;
      +[SCNTransaction postCommandWithContext:v13 object:self key:@"projectionTransform" applyBlock:v17];
    }
  }
}

double __36__SCNCamera_setProjectionTransform___block_invoke(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  C3DMatrix4x4FromSCNMatrix4(&v6, a1 + 40);
  if (*((float *)&v8 + 2) > 0.0)
  {
    simd_float4x4 v15 = __invert_f4(*(simd_float4x4 *)_PromotedConst_0);
    uint64_t v2 = 0;
    v10[0] = v6;
    v10[1] = v7;
    v10[2] = v8;
    v10[3] = v9;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    do
    {
      *(long long *)((char *)&v11 + v2 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v15.columns[0], COERCE_FLOAT(v10[v2])), (float32x4_t)v15.columns[1], *(float32x2_t *)&v10[v2], 1), (float32x4_t)v15.columns[2], (float32x4_t)v10[v2], 2), (float32x4_t)v15.columns[3], (float32x4_t)v10[v2], 3);
      ++v2;
    }
    while (v2 != 4);
    long long v6 = v11;
    long long v7 = v12;
    long long v8 = v13;
    long long v9 = v14;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  v5[3] = v9;
  *(void *)&double result = C3DCameraSetProjectionTransform(v3, (uint64_t)v5).n128_u64[0];
  return result;
}

- (SCNMatrix4)projectionTransform
{
  if (self) {
    return (SCNMatrix4 *)-[SCNMatrix4 projectionTransformWithViewportSize:](self, "projectionTransformWithViewportSize:", 1.0, 1.0);
  }
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  return self;
}

- (SCNMatrix4)projectionTransformWithViewportSize:(SEL)a3
{
  char v4 = self;
  memset(&v35, 0, sizeof(v35));
  unsigned int m21_low = LOBYTE(self->m21);
  if (m21_low)
  {
    CGFloat height = viewportSize.height;
    CGFloat width = viewportSize.width;
    uint64_t v11 = [(SCNMatrix4 *)self sceneRef];
    uint64_t v12 = v11;
    if (v11) {
      C3DSceneLock(v11);
    }
    v13.f64[0] = width;
    v13.f64[1] = height;
    v22[0] = vcvt_hight_f32_f64(0, v13);
    uint64_t ProjectionInfosPtr = (char *)C3DCameraGetProjectionInfosPtr(*(void *)&v4->m13);
    self = (SCNMatrix4 *)C3DProjectionInfosGetMatrix(ProjectionInfosPtr, (uint64_t)v22, 0);
    if (self)
    {
      C3DMatrix4x4ToSCNMatrix4((uint64_t)self, &v35);
      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
      SCNMatrix4 v35 = SCNMatrix4Identity;
      if (!v12) {
        goto LABEL_9;
      }
    }
    self = (SCNMatrix4 *)C3DSceneUnlock(v12);
    goto LABEL_9;
  }
  if ((m21_low & 2) != 0)
  {
    long long v18 = *(_OWORD *)&self[2].m43;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m33;
    *(_OWORD *)&retstr->m21 = v18;
    long long v16 = *(_OWORD *)&self[3].m13;
    long long v17 = *(_OWORD *)&self[3].m23;
    goto LABEL_11;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  memset(v22, 0, sizeof(v22));
  *(double *)&long long v25 = self[2].m23;
  *(_OWORD *)((char *)v22 + 8) = *(_OWORD *)&self[1].m11;
  float32x2_t v7 = *(float32x2_t *)&self->m41;
  *(void *)&long long v24 = *(void *)&self->m43;
  DWORD2(v24) = LODWORD(self[1].m21);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v33 = 0u;
  float64x2_t v34 = vcvtq_f64_f32(v7);
  LOBYTE(v22[0]) = (m21_low >> 1) & 0x20 | ((m21_low & 8) != 0) | (((m21_low & 0x20) != 0) << 6) | (16
                                                                                                  * ((m21_low & 4) != 0));
  uint64_t v8 = *(void *)&self[1].m33;
  *((void *)&v22[1] + 1) = *(void *)&self[1].m31;
  *(void *)&long long v23 = v8;
  *((void *)&v23 + 1) = *(void *)&self[1].m41;
  CGFloat v9 = viewportSize.height;
  float32x4_t v21 = vcvt_hight_f32_f64(0, (float64x2_t)viewportSize);
  Matrix = C3DProjectionInfosGetMatrix((char *)v22, (uint64_t)&v21, 0);
  C3DMatrix4x4ToSCNMatrix4((uint64_t)Matrix, &v35);
LABEL_9:
  long long v15 = *(_OWORD *)&v35.m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v35.m11;
  *(_OWORD *)&retstr->m21 = v15;
  long long v16 = *(_OWORD *)&v35.m31;
  long long v17 = *(_OWORD *)&v35.m41;
LABEL_11:
  *(_OWORD *)&retstr->m31 = v16;
  *(_OWORD *)&retstr->m41 = v17;
  return self;
}

- (SCNMaterialProperty)colorGrading
{
  double result = *(SCNMaterialProperty **)&self->_wantsHDR;
  if (!result)
  {
    double result = [[SCNMaterialProperty alloc] initWithParent:self propertyType:26];
    *(void *)&self->_wantsHDR = result;
  }
  return result;
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
  objc_msgSend(v4, "setName:", -[SCNCamera name](self, "name"));
  objc_msgSend(v4, "setIdentifier:", -[SCNCamera identifier](self, "identifier"));
  objc_msgSend(v4, "setWantsDepthOfField:", -[SCNCamera wantsDepthOfField](self, "wantsDepthOfField"));
  objc_msgSend(v4, "setApertureBladeCount:", -[SCNCamera apertureBladeCount](self, "apertureBladeCount"));
  objc_msgSend(v4, "setFocalBlurSampleCount:", -[SCNCamera focalBlurSampleCount](self, "focalBlurSampleCount"));
  [(SCNCamera *)self focalSize];
  objc_msgSend(v4, "setFocalSize:");
  objc_msgSend(v4, "setName:", -[SCNCamera name](self, "name"));
  [(SCNCamera *)self aspectRatio];
  objc_msgSend(v4, "setAspectRatio:");
  [(SCNCamera *)self focusDistance];
  objc_msgSend(v4, "setFocusDistance:");
  [(SCNCamera *)self fStop];
  objc_msgSend(v4, "setFStop:");
  if ((*((unsigned char *)self + 16) & 4) != 0)
  {
    [(SCNCamera *)self xFov];
    objc_msgSend(v4, "setXFov:");
    [(SCNCamera *)self yFov];
    objc_msgSend(v4, "setYFov:");
  }
  else
  {
    [(SCNCamera *)self sensorHeight];
    objc_msgSend(v4, "setSensorHeight:");
    [(SCNCamera *)self fieldOfView];
    objc_msgSend(v4, "setFieldOfView:");
  }
  [(SCNCamera *)self lensShift];
  objc_msgSend(v4, "setLensShift:");
  [(SCNCamera *)self postProjectionTransform];
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [v4 setPostProjectionTransform:v6];
  objc_msgSend(v4, "setFillMode:", -[SCNCamera fillMode](self, "fillMode"));
  objc_msgSend(v4, "setProjectionDirection:", -[SCNCamera projectionDirection](self, "projectionDirection"));
  [(SCNCamera *)self zNear];
  objc_msgSend(v4, "setZNear:");
  [(SCNCamera *)self zFar];
  objc_msgSend(v4, "setZFar:");
  [(SCNCamera *)self orthographicScale];
  objc_msgSend(v4, "setOrthographicScale:");
  objc_msgSend(v4, "setAutomaticallyAdjustsZRange:", -[SCNCamera automaticallyAdjustsZRange](self, "automaticallyAdjustsZRange"));
  objc_msgSend(v4, "setUsesOrthographicProjection:", -[SCNCamera usesOrthographicProjection](self, "usesOrthographicProjection"));
  objc_msgSend(v4, "setWantsHDR:", -[SCNCamera wantsHDR](self, "wantsHDR"));
  [(SCNCamera *)self whitePoint];
  objc_msgSend(v4, "setWhitePoint:");
  [(SCNCamera *)self averageGray];
  objc_msgSend(v4, "setAverageGray:");
  objc_msgSend(v4, "setWantsExposureAdaptation:", -[SCNCamera wantsExposureAdaptation](self, "wantsExposureAdaptation"));
  [(SCNCamera *)self exposureAdaptationDuration];
  objc_msgSend(v4, "setExposureAdaptationDuration:");
  [(SCNCamera *)self exposureAdaptationBrighteningSpeedFactor];
  objc_msgSend(v4, "setExposureAdaptationBrighteningSpeedFactor:");
  [(SCNCamera *)self exposureAdaptationDarkeningSpeedFactor];
  objc_msgSend(v4, "setExposureAdaptationDarkeningSpeedFactor:");
  [(SCNCamera *)self exposureAdaptationHistogramRangeLowProbability];
  objc_msgSend(v4, "setExposureAdaptationHistogramRangeLowProbability:");
  [(SCNCamera *)self exposureAdaptationHistogramRangeHighProbability];
  objc_msgSend(v4, "setExposureAdaptationHistogramRangeHighProbability:");
  objc_msgSend(v4, "setExposureAdaptationMode:", -[SCNCamera exposureAdaptationMode](self, "exposureAdaptationMode"));
  [(SCNCamera *)self minimumExposure];
  objc_msgSend(v4, "setMinimumExposure:");
  [(SCNCamera *)self maximumExposure];
  objc_msgSend(v4, "setMaximumExposure:");
  [(SCNCamera *)self bloomIntensity];
  objc_msgSend(v4, "setBloomIntensity:");
  [(SCNCamera *)self bloomThreshold];
  objc_msgSend(v4, "setBloomThreshold:");
  objc_msgSend(v4, "setBloomIterationCount:", -[SCNCamera bloomIterationCount](self, "bloomIterationCount"));
  [(SCNCamera *)self bloomIterationSpread];
  objc_msgSend(v4, "setBloomIterationSpread:");
  [(SCNCamera *)self bloomBlurRadius];
  objc_msgSend(v4, "setBloomBlurRadius:");
  [(SCNCamera *)self vignettingPower];
  objc_msgSend(v4, "setVignettingPower:");
  [(SCNCamera *)self vignettingIntensity];
  objc_msgSend(v4, "setVignettingIntensity:");
  [(SCNCamera *)self colorFringeStrength];
  objc_msgSend(v4, "setColorFringeStrength:");
  [(SCNCamera *)self colorFringeIntensity];
  objc_msgSend(v4, "setColorFringeIntensity:");
  [(SCNCamera *)self saturation];
  objc_msgSend(v4, "setSaturation:");
  [(SCNCamera *)self contrast];
  objc_msgSend(v4, "setContrast:");
  [(SCNCamera *)self grainIntensity];
  objc_msgSend(v4, "setGrainIntensity:");
  [(SCNCamera *)self grainScale];
  objc_msgSend(v4, "setGrainScale:");
  objc_msgSend(v4, "setGrainIsColored:", -[SCNCamera grainIsColored](self, "grainIsColored"));
  [(SCNCamera *)self whiteBalanceTemperature];
  objc_msgSend(v4, "setWhiteBalanceTemperature:");
  [(SCNCamera *)self whiteBalanceTint];
  objc_msgSend(v4, "setWhiteBalanceTint:");
  [(SCNCamera *)self motionBlurIntensity];
  objc_msgSend(v4, "setMotionBlurIntensity:");
  [(SCNCamera *)self screenSpaceAmbientOcclusionIntensity];
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionIntensity:");
  [(SCNCamera *)self screenSpaceAmbientOcclusionRadius];
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionRadius:");
  [(SCNCamera *)self screenSpaceAmbientOcclusionBias];
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionBias:");
  [(SCNCamera *)self screenSpaceAmbientOcclusionDepthThreshold];
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionDepthThreshold:");
  [(SCNCamera *)self screenSpaceAmbientOcclusionNormalThreshold];
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionNormalThreshold:");
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionSampleCount:", -[SCNCamera screenSpaceAmbientOcclusionSampleCount](self, "screenSpaceAmbientOcclusionSampleCount"));
  objc_msgSend(v4, "setScreenSpaceAmbientOcclusionDownSample:", -[SCNCamera screenSpaceAmbientOcclusionDownSample](self, "screenSpaceAmbientOcclusionDownSample"));
  objc_msgSend(v4, "setCategoryBitMask:", -[SCNCamera categoryBitMask](self, "categoryBitMask"));
  [v4 _copyAnimationsFrom:self];
  +[SCNTransaction commitImmediate];
  return v4;
}

- (id)copy
{
  return [(SCNCamera *)self copyWithZone:0];
}

- (void)_customEncodingOfSCNCamera:(id)a3
{
  if ((*((unsigned char *)self + 16) & 2) != 0)
  {
    long long v3 = *(_OWORD *)&self->_projectionTransform.m23;
    v5[0] = *(_OWORD *)&self->_projectionTransform.m13;
    v5[1] = v3;
    long long v4 = *(_OWORD *)&self->_projectionTransform.m43;
    v5[2] = *(_OWORD *)&self->_projectionTransform.m33;
    v5[3] = v4;
    SCNEncodeSCNMatrix4(a3, (const char *)@"projectionTransform", (uint64_t)v5);
  }
}

- (CGFloat)focalSize
{
  return 0.0;
}

- (void)_didDecodeSCNCamera:(id)a3
{
  if ([a3 containsValueForKey:@"projectionTransform"])
  {
    SCNDecodeSCNMatrix4(a3, @"projectionTransform", v6);
    v5[0] = v6[0];
    v5[1] = v6[1];
    v5[2] = v6[2];
    v5[3] = v6[3];
    [(SCNCamera *)self setProjectionTransform:v5];
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (*((unsigned char *)self + 16)) {
    [(SCNCamera *)self _syncObjCModel];
  }
  [(SCNCamera *)self _customEncodingOfSCNCamera:a3];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 3) & 1 forKey:@"usesOrthographicProjection"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 4) & 1 forKey:@"automaticallyAdjustsZRange"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 5) & 1 forKey:@"fillMode"];
  [a3 encodeInt:(*((unsigned __int8 *)self + 16) >> 6) & 1 forKey:@"projectionDirection"];
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  if ((*((unsigned char *)self + 16) & 4) != 0)
  {
    [a3 encodeDouble:@"xFov" forKey:self->_xFov];
    yfloat Fov = self->_yFov;
    CGFloat v9 = @"yFov";
  }
  else
  {
    *(float *)&double v5 = self->_fieldOfView;
    [a3 encodeFloat:@"fov" forKey:v5];
    *(float *)&double v7 = self->_sensorSize;
    [a3 encodeFloat:@"sensorSize" forKey:v7];
    yfloat Fov = self->_fieldOfView;
    if ((*((unsigned char *)self + 16) & 0x40) != 0) {
      CGFloat v9 = @"xFov";
    }
    else {
      CGFloat v9 = @"yFov";
    }
  }
  [a3 encodeDouble:v9 forKey:yFov];
  uint32x2_t v10 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_lensShift[4]));
  if ((vpmax_u32(v10, v10).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", @"lensShiftX");
    LODWORD(v11) = *(_DWORD *)self->_postProjectionTransformTranslation;
    [a3 encodeFloat:@"lensShiftY" forKey:v11];
  }
  uint32x2_t v12 = (uint32x2_t)vmvn_s8((int8x8_t)vceqz_f32(*(float32x2_t *)&self->_postProjectionTransformTranslation[4]));
  if ((vpmax_u32(v12, v12).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", @"postProjectionTransformTranslationX");
    LODWORD(v13) = *(_DWORD *)self->_postProjectionTransformScale;
    [a3 encodeFloat:@"postProjectionTransformTranslationY" forKey:v13];
  }
  __asm { FMOV            V1.2S, #1.0 }
  uint32x2_t v19 = (uint32x2_t)vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&self->_postProjectionTransformScale[4], _D1));
  if ((vpmax_u32(v19, v19).u32[0] & 0x80000000) != 0)
  {
    objc_msgSend(a3, "encodeFloat:forKey:", @"postProjectionTransformScaleX");
    *(float *)&double v20 = self->_fStop;
    [a3 encodeFloat:@"postProjectionTransformScaleY" forKey:v20];
  }
  [a3 encodeDouble:@"orthographicScale" forKey:self->_orthographicScale];
  [a3 encodeDouble:@"zNear" forKey:self->_zNear];
  [a3 encodeDouble:@"zFar" forKey:self->_zFar];
  LODWORD(v21) = self->_bladeCount;
  [a3 encodeFloat:@"dofIntensity" forKey:v21];
  *(float *)&double v22 = self->_dofIntensity;
  [a3 encodeFloat:@"focusDistance" forKey:v22];
  *(float *)&double v23 = self->_focusDistance;
  [a3 encodeFloat:@"fStop" forKey:v23];
  [a3 encodeInteger:self->_focalBlurSampleCount forKey:@"bladeCount"];
  [a3 encodeInteger:*(void *)&self->_aspectRatio forKey:@"focalBlurSampleCount"];
  [a3 encodeInteger:*(void *)&self->_bloomIntensity forKey:@"exposureAdaptationMode"];
  [a3 encodeInteger:*(void *)&self->_projectionTransform.m11 forKey:@"categoryBitMask"];
  colorGrading = self->_colorGrading;
  if (colorGrading) {
    [a3 encodeObject:colorGrading forKey:@"technique"];
  }
  uint64_t v25 = *(void *)&self->_wantsHDR;
  if (v25) {
    [a3 encodeObject:v25 forKey:@"colorGrading"];
  }
  [a3 encodeBool:LOBYTE(self->_averageGray) forKey:@"wantsHDR"];
  [a3 encodeBool:LOBYTE(self->_exposureAdaptationBrighteningSpeedFactor) forKey:@"wantsExposureAdaptation"];
  *(float *)&double v26 = self->_exposureOffset;
  [a3 encodeFloat:@"whitePoint" forKey:v26];
  *(float *)&double v27 = self->_minimumExposure;
  [a3 encodeFloat:@"averageGray" forKey:v27];
  *(float *)&double v28 = self->_maximumExposure;
  [a3 encodeFloat:@"exposureOffset" forKey:v28];
  *(float *)&double v29 = self->_exposureAdaptationDarkeningSpeedFactor;
  [a3 encodeFloat:@"exposureAdaptationDuration" forKey:v29];
  LODWORD(v30) = LODWORD(self->_exposureAdaptationHistogramRangeHighProbability);
  [a3 encodeFloat:@"exposureAdaptationBrighteningSpeedFactor" forKey:v30];
  LODWORD(v31) = HIDWORD(self->_exposureAdaptationHistogramRangeHighProbability);
  [a3 encodeFloat:@"exposureAdaptationDarkeningSpeedFactor" forKey:v31];
  double v32 = *(double *)&self->_exposureAdaptationMode;
  *(float *)&double v32 = v32;
  [a3 encodeFloat:@"exposureAdaptationHistogramRangeLowProbability" forKey:v32];
  double exposureAdaptationHistogramRangeLowProbability = self->_exposureAdaptationHistogramRangeLowProbability;
  *(float *)&double exposureAdaptationHistogramRangeLowProbability = exposureAdaptationHistogramRangeLowProbability;
  [a3 encodeFloat:@"exposureAdaptationHistogramRangeHighProbability" forKey:exposureAdaptationHistogramRangeLowProbability];
  LODWORD(v34) = *(_DWORD *)&self->_wantsExposureAdaptation;
  [a3 encodeFloat:@"minimumExposure" forKey:v34];
  *(float *)&double v35 = self->_exposureAdaptationDuration;
  [a3 encodeFloat:@"maximumExposure" forKey:v35];
  LODWORD(v36) = self->_bloomIteration;
  [a3 encodeFloat:@"bloomIntensity" forKey:v36];
  *(float *)&double v37 = self->_bloomIterationSpread;
  [a3 encodeFloat:@"bloomThreshold" forKey:v37];
  [a3 encodeInteger:SLODWORD(self->_bloomBlurRadius) forKey:@"bloomIteration"];
  *(float *)&double v38 = self->_motionBlurIntensity;
  [a3 encodeFloat:@"bloomIterationSpread" forKey:v38];
  *(float *)&double v39 = self->_vignettingPower;
  [a3 encodeFloat:@"bloomBlurRadius" forKey:v39];
  *(float *)&double v40 = self->_vignettingIntensity;
  [a3 encodeFloat:@"motionBlurIntensity" forKey:v40];
  *(float *)&double v41 = self->_colorFringeStrength;
  [a3 encodeFloat:@"vignettingPower" forKey:v41];
  *(float *)&double v42 = self->_colorFringeIntensity;
  [a3 encodeFloat:@"vignettingIntensity" forKey:v42];
  *(float *)&double v43 = self->_saturation;
  [a3 encodeFloat:@"colorFringeStrength" forKey:v43];
  *(float *)&double v44 = self->_contrast;
  [a3 encodeFloat:@"colorFringeIntensity" forKey:v44];
  *(float *)&double v45 = self->_grainIntensity;
  [a3 encodeFloat:@"saturation" forKey:v45];
  *(float *)&double v46 = self->_grainScale;
  [a3 encodeFloat:@"contrast" forKey:v46];
  LODWORD(v47) = *(_DWORD *)&self->_grainIsColored;
  [a3 encodeFloat:@"grainIntensity" forKey:v47];
  *(float *)&double v48 = self->_whiteBalanceTemperature;
  [a3 encodeFloat:@"grainScale" forKey:v48];
  [a3 encodeBool:LOBYTE(self->_whiteBalanceTint) forKey:@"grainIsColored"];
  LODWORD(v49) = *((_DWORD *)&self->_whiteBalanceTint + 1);
  [a3 encodeFloat:@"whiteBalanceTemperature" forKey:v49];
  *(float *)&double v50 = self->_screenSpaceAmbientOcclusion.intensity;
  [a3 encodeFloat:@"whiteBalanceTint" forKey:v50];
  *(float *)&double v51 = self->_screenSpaceAmbientOcclusion.bias;
  [a3 encodeFloat:@"screenSpaceAmbientOcclusionIntensity" forKey:v51];
  *(float *)&double v52 = self->_screenSpaceAmbientOcclusion.depthThreshold;
  [a3 encodeFloat:@"screenSpaceAmbientOcclusionRadius" forKey:v52];
  *(float *)&double v53 = self->_screenSpaceAmbientOcclusion.normalThreshold;
  [a3 encodeFloat:@"screenSpaceAmbientOcclusionBias" forKey:v53];
  LODWORD(v54) = *((_DWORD *)&self->_screenSpaceAmbientOcclusion.normalThreshold + 1);
  [a3 encodeFloat:@"screenSpaceAmbientOcclusionDepthThreshold" forKey:v54];
  LODWORD(v55) = self->_screenSpaceAmbientOcclusion.sampleCount;
  [a3 encodeFloat:@"screenSpaceAmbientOcclusionNormalThreshold" forKey:v55];
  [a3 encodeInteger:self->_screenSpaceAmbientOcclusion.downSample forKey:@"screenSpaceAmbientOcclusionSampleCount"];
  [a3 encodeInteger:self->_grainTexture forKey:@"screenSpaceAmbientOcclusionDownSample"];
  SCNEncodeEntity(a3, self);

  SCNEncodeAnimations(a3, self);
}

- (SCNCamera)initWithCoder:(id)a3
{
  v60.receiver = self;
  v60.super_class = (Class)SCNCamera;
  long long v4 = [(SCNCamera *)&v60 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    uint64_t v6 = C3DCameraCreate();
    v4->_camerSCNMatrix4 a = (__C3DCamera *)v6;
    if (v6) {
      C3DEntitySetObjCWrapper(v6, v4);
    }
    [(SCNCamera *)v4 _syncObjCModel];
    -[SCNCamera setUsesOrthographicProjection:](v4, "setUsesOrthographicProjection:", [a3 decodeIntForKey:@"usesOrthographicProjection"] != 0);
    -[SCNCamera setAutomaticallyAdjustsZRange:](v4, "setAutomaticallyAdjustsZRange:", [a3 decodeIntForKey:@"automaticallyAdjustsZRange"] != 0);
    -[SCNCamera setFillMode:](v4, "setFillMode:", (int)[a3 decodeIntForKey:@"fillMode"]);
    -[SCNCamera setProjectionDirection:](v4, "setProjectionDirection:", (int)[a3 decodeIntForKey:@"projectionDirection"]);
    -[SCNCamera setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    if ([a3 containsValueForKey:@"fov"])
    {
      [a3 decodeFloatForKey:@"sensorSize"];
      [(SCNCamera *)v4 setSensorHeight:v7];
      [a3 decodeFloatForKey:@"fov"];
      [(SCNCamera *)v4 setFieldOfView:v8];
    }
    else
    {
      [a3 decodeFloatForKey:@"xFov"];
      [(SCNCamera *)v4 setXFov:v9];
      [a3 decodeFloatForKey:@"yFov"];
      [(SCNCamera *)v4 setYFov:v10];
    }
    if ([a3 containsValueForKey:@"lensShiftX"])
    {
      [a3 decodeFloatForKey:@"lensShiftX"];
      unsigned int v57 = v11;
      [a3 decodeFloatForKey:@"lensShiftY"];
      [(SCNCamera *)v4 setLensShift:COERCE_DOUBLE(__PAIR64__(v12, v57))];
    }
    else
    {
      *(void *)&v4->_lensShift[4] = 0;
    }
    if ([a3 containsValueForKey:@"postProjectionTransformTranslationX"])
    {
      [a3 decodeFloatForKey:@"postProjectionTransformTranslationX"];
      unsigned int v58 = v13;
      [a3 decodeFloatForKey:@"postProjectionTransformTranslationY"];
      [(SCNCamera *)v4 setPostProjectionTransformTranslation:COERCE_DOUBLE(__PAIR64__(v14, v58))];
    }
    else
    {
      *(void *)&v4->_postProjectionTransformTranslation[4] = 0;
    }
    if ([a3 containsValueForKey:@"postProjectionTransformScaleX"])
    {
      [a3 decodeFloatForKey:@"postProjectionTransformScaleX"];
      unsigned int v59 = v15;
      [a3 decodeFloatForKey:@"postProjectionTransformScaleY"];
      [(SCNCamera *)v4 setPostProjectionTransformScale:COERCE_DOUBLE(__PAIR64__(v16, v59))];
    }
    else
    {
      __asm { FMOV            V0.2S, #1.0 }
      *(void *)&v4->_postProjectionTransformScale[4] = _D0;
    }
    [a3 decodeDoubleForKey:@"orthographicScale"];
    -[SCNCamera setOrthographicScale:](v4, "setOrthographicScale:");
    [a3 decodeDoubleForKey:@"zNear"];
    -[SCNCamera setZNear:](v4, "setZNear:");
    [a3 decodeDoubleForKey:@"zFar"];
    -[SCNCamera setZFar:](v4, "setZFar:");
    [a3 decodeFloatForKey:@"focusDistance"];
    [(SCNCamera *)v4 setFocusDistance:v22];
    if ([a3 containsValueForKey:@"dofIntensity"])
    {
      [a3 decodeFloatForKey:@"dofIntensity"];
      [(SCNCamera *)v4 setWantsDepthOfField:v23 > 0.0];
    }
    else
    {
      [a3 decodeFloatForKey:@"focalBlurRadius"];
      [(SCNCamera *)v4 setFocalBlurRadius:v24];
    }
    if ([a3 containsValueForKey:@"fStop"])
    {
      [a3 decodeFloatForKey:@"fStop"];
      [(SCNCamera *)v4 setFStop:v25];
    }
    if ([a3 containsValueForKey:@"bladeCount"]) {
      -[SCNCamera setApertureBladeCount:](v4, "setApertureBladeCount:", [a3 decodeIntegerForKey:@"bladeCount"]);
    }
    if ([a3 containsValueForKey:@"focalBlurSampleCount"]) {
      -[SCNCamera setFocalBlurSampleCount:](v4, "setFocalBlurSampleCount:", [a3 decodeIntegerForKey:@"focalBlurSampleCount"]);
    }
    -[SCNCamera setCategoryBitMask:](v4, "setCategoryBitMask:", [a3 decodeIntegerForKey:@"categoryBitMask"]);
    -[SCNCamera setTechnique:](v4, "setTechnique:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"technique"]);
    if ([a3 containsValueForKey:@"wantsHDR"])
    {
      -[SCNCamera setWantsHDR:](v4, "setWantsHDR:", [a3 decodeBoolForKey:@"wantsHDR"]);
      -[SCNCamera setWantsExposureAdaptation:](v4, "setWantsExposureAdaptation:", [a3 decodeBoolForKey:@"wantsExposureAdaptation"]);
      [a3 decodeFloatForKey:@"whitePoint"];
      [(SCNCamera *)v4 setWhitePoint:v26];
      [a3 decodeFloatForKey:@"averageGray"];
      [(SCNCamera *)v4 setAverageGray:v27];
      [a3 decodeFloatForKey:@"exposureOffset"];
      [(SCNCamera *)v4 setExposureOffset:v28];
      [a3 decodeFloatForKey:@"exposureAdaptationDuration"];
      [(SCNCamera *)v4 setExposureAdaptationDuration:v29];
      [a3 decodeFloatForKey:@"exposureAdaptationBrighteningSpeedFactor"];
      [(SCNCamera *)v4 setExposureAdaptationBrighteningSpeedFactor:v30];
      [a3 decodeFloatForKey:@"exposureAdaptationDarkeningSpeedFactor"];
      [(SCNCamera *)v4 setExposureAdaptationDarkeningSpeedFactor:v31];
      if ([a3 containsValueForKey:@"exposureAdaptationMode"])
      {
        [a3 decodeFloatForKey:@"exposureAdaptationHistogramRangeLowProbability"];
        [(SCNCamera *)v4 setExposureAdaptationHistogramRangeLowProbability:v32];
        [a3 decodeFloatForKey:@"exposureAdaptationHistogramRangeHighProbability"];
        [(SCNCamera *)v4 setExposureAdaptationHistogramRangeHighProbability:v33];
        -[SCNCamera setExposureAdaptationMode:](v4, "setExposureAdaptationMode:", [a3 decodeIntegerForKey:@"exposureAdaptationMode"]);
      }
      [a3 decodeFloatForKey:@"minimumExposure"];
      [(SCNCamera *)v4 setMinimumExposure:v34];
      [a3 decodeFloatForKey:@"maximumExposure"];
      [(SCNCamera *)v4 setMaximumExposure:v35];
      [a3 decodeFloatForKey:@"bloomIntensity"];
      [(SCNCamera *)v4 setBloomIntensity:v36];
      [a3 decodeFloatForKey:@"bloomThreshold"];
      [(SCNCamera *)v4 setBloomThreshold:v37];
      if ([a3 containsValueForKey:@"bloomIteration"])
      {
        -[SCNCamera setBloomIterationCount:](v4, "setBloomIterationCount:", [a3 decodeIntegerForKey:@"bloomIteration"]);
        [a3 decodeFloatForKey:@"bloomIterationSpread"];
        [(SCNCamera *)v4 setBloomIterationSpread:v38];
      }
      [a3 decodeFloatForKey:@"bloomBlurRadius"];
      [(SCNCamera *)v4 setBloomBlurRadius:v39];
      [a3 decodeFloatForKey:@"motionBlurIntensity"];
      [(SCNCamera *)v4 setMotionBlurIntensity:v40];
    }
    *(void *)&v4->_wantsHDR = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"colorGrading"];
    if ([a3 containsValueForKey:@"vignettingPower"])
    {
      [a3 decodeFloatForKey:@"vignettingPower"];
      [(SCNCamera *)v4 setVignettingPower:v41];
      [a3 decodeFloatForKey:@"vignettingIntensity"];
      [(SCNCamera *)v4 setVignettingIntensity:v42];
      [a3 decodeFloatForKey:@"colorFringeStrength"];
      [(SCNCamera *)v4 setColorFringeStrength:v43];
      [a3 decodeFloatForKey:@"colorFringeIntensity"];
      [(SCNCamera *)v4 setColorFringeIntensity:v44];
      [a3 decodeFloatForKey:@"saturation"];
      [(SCNCamera *)v4 setSaturation:v45];
      [a3 decodeFloatForKey:@"contrast"];
      [(SCNCamera *)v4 setContrast:v46];
      [a3 decodeFloatForKey:@"whiteBalanceTemperature"];
      [(SCNCamera *)v4 setWhiteBalanceTemperature:v47];
      [a3 decodeFloatForKey:@"whiteBalanceTint"];
      [(SCNCamera *)v4 setWhiteBalanceTint:v48];
    }
    if ([a3 containsValueForKey:@"grainIntensity"])
    {
      [a3 decodeFloatForKey:@"grainIntensity"];
      [(SCNCamera *)v4 setGrainIntensity:v49];
      [a3 decodeFloatForKey:@"grainScale"];
      [(SCNCamera *)v4 setGrainScale:v50];
      -[SCNCamera setGrainIsColored:](v4, "setGrainIsColored:", [a3 decodeBoolForKey:@"grainIsColored"]);
    }
    if ([a3 containsValueForKey:@"screenSpaceAmbientOcclusionIntensity"])
    {
      [a3 decodeFloatForKey:@"screenSpaceAmbientOcclusionIntensity"];
      [(SCNCamera *)v4 setScreenSpaceAmbientOcclusionIntensity:v51];
      [a3 decodeFloatForKey:@"screenSpaceAmbientOcclusionRadius"];
      [(SCNCamera *)v4 setScreenSpaceAmbientOcclusionRadius:v52];
      [a3 decodeFloatForKey:@"screenSpaceAmbientOcclusionBias"];
      [(SCNCamera *)v4 setScreenSpaceAmbientOcclusionBias:v53];
      [a3 decodeFloatForKey:@"screenSpaceAmbientOcclusionDepthThreshold"];
      [(SCNCamera *)v4 setScreenSpaceAmbientOcclusionDepthThreshold:v54];
      [a3 decodeFloatForKey:@"screenSpaceAmbientOcclusionNormalThreshold"];
      [(SCNCamera *)v4 setScreenSpaceAmbientOcclusionNormalThreshold:v55];
      -[SCNCamera setScreenSpaceAmbientOcclusionSampleCount:](v4, "setScreenSpaceAmbientOcclusionSampleCount:", [a3 decodeIntegerForKey:@"screenSpaceAmbientOcclusionSampleCount"]);
      -[SCNCamera setScreenSpaceAmbientOcclusionDownSample:](v4, "setScreenSpaceAmbientOcclusionDownSample:", [a3 decodeIntegerForKey:@"screenSpaceAmbientOcclusionDownSample"]);
    }
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    SCNDecodeEntity(a3, v4);
    SCNDecodeAnimations(a3, v4);
    [(SCNCamera *)v4 _didDecodeSCNCamera:a3];
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
  long long v3 = [(SCNCamera *)self sceneRef];
  if (!v3) {
    return 0;
  }
  long long v4 = +[SCNScene sceneWithSceneRef:v3];
  uint64_t v9 = 0;
  float v10 = &v9;
  uint64_t v11 = 0x3052000000;
  unsigned int v12 = __Block_byref_object_copy__10;
  unsigned int v13 = __Block_byref_object_dispose__10;
  uint64_t v14 = 0;
  BOOL v5 = [(SCNScene *)v4 rootNode];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__SCNCamera_SCN_DTAdditions__debugQuickLookObject__block_invoke;
  v8[3] = &unk_2640069C8;
  v8[4] = self;
  void v8[5] = &v9;
  [(SCNNode *)v5 enumerateChildNodesUsingBlock:v8];
  if (!v10[5])
  {
    _Block_object_dispose(&v9, 8);
    return 0;
  }
  id v6 = -[SCNScene debugQuickLookObjectWithPointOfView:](v4, "debugQuickLookObjectWithPointOfView:");
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __50__SCNCamera_SCN_DTAdditions__debugQuickLookObject__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 camera];
  if (result == *(void *)(a1 + 32))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
    *a3 = 1;
  }
  return result;
}

- (id)debugQuickLookData
{
  uint64_t v2 = [(SCNCamera *)self debugQuickLookObject];

  return UIImagePNGRepresentation(v2);
}

- (void)setName:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionBias:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionDepthThreshold:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionNormalThreshold:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionSampleCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setScreenSpaceAmbientOcclusionDownSample:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAutomaticallyAdjustsZRange:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setAverageGray:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBloomBlurRadius:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBloomIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBloomThreshold:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBloomIterationCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setBloomIterationSpread:.cold.1()
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

- (void)setColorFringeStrength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setColorFringeIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setContrast:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setGrainIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setGrainScale:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setGrainIsColored:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setGrainSlice:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setGrainTexture:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWhiteBalanceTemperature:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWhiteBalanceTint:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationBrighteningSpeedFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationDarkeningSpeedFactor:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationDuration:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationHistogramRangeHighProbability:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationHistogramRangeLowProbability:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureAdaptationMode:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setExposureOffset:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setDofIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMaximumExposure:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMinimumExposure:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setMotionBlurIntensity:.cold.1()
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

- (void)setSaturation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setUsesOrthographicProjection:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setVignettingIntensity:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setVignettingPower:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWantsExposureAdaptation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWantsHDR:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setWhitePoint:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setXFov:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setYFov:.cold.1()
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

- (void)setLensShift:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPostProjectionTransform:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPostProjectionTransformTranslation:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setPostProjectionTransformScale:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFieldOfView:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setSensorHeight:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFocalLength:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFStop:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setApertureBladeCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFocalBlurSampleCount:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setFocusDistance:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

- (void)setProjectionTransform:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_7(&dword_20B249000, v0, v1, "Error: can't set a property (%s::%d) on the presentation instance %@ - ignoring", v2, v3, v4, v5, 2u);
}

@end