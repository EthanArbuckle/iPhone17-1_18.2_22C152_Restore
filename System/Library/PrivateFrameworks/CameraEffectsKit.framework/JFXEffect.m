@interface JFXEffect
+ (BOOL)effectIDIsNone:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (int64_t)defaultPlayableAspectRatio;
+ (int64_t)defaultPlayableAspectRatioPreservationMode;
- ($70930193D4F448A53BB9343C0237EB5F)rangeForPresentationRange:(SEL)a3;
- (BOOL)arePreviewingAssetsLocal;
- (BOOL)areRenderingAssetsLocal;
- (BOOL)buildInAnimation;
- (BOOL)enablePresentationState:(BOOL)a3;
- (BOOL)forceDisableLooping;
- (BOOL)forceRenderAtPosterFrame;
- (BOOL)isAppearanceEqual:(id)a3;
- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4;
- (BOOL)isConfiguredForOutputAspect:(double)a3;
- (BOOL)isConfiguredForOutputAspectMatchingSize:(CGSize)a3;
- (BOOL)isContentAvailable;
- (BOOL)isContentNew;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isNone;
- (BOOL)loadRenderEffect;
- (BOOL)loopedRangeRenderIsCacheable;
- (BOOL)renderEffectResourcesAreReady;
- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5;
- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6;
- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 ignoreTranslation:(int)a7;
- (CGRect)playableRectInOutputSize:(CGSize)a3;
- (CGSize)renderSize;
- (JFXEffect)initWithCoder:(id)a3;
- (JFXEffect)initWithEffectID:(id)a3;
- (JFXEffectContentDataSource)contentDataSource;
- (NSDictionary)effectParameters;
- (NSString)contentVersion;
- (NSString)description;
- (NSString)effectID;
- (NSString)motionDocumentFolderPath;
- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5;
- (PVMatrix44Double)topLevelTransformObject;
- (PVTransformAnimation)transformAnimation;
- (double)outputAspect;
- (double)playableScaleInOutputSize:(CGSize)a3;
- (float)opacity;
- (id)JFX_defaultMotionDocumentFolderLocalURL;
- (id)accessibilityName;
- (id)availableAssetsWithFilteringOptions:(id)a3;
- (id)availableAssetsWithFilteringOptionsArray:(id)a3;
- (id)contentProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)describeRequest:(id)a3;
- (id)displayName;
- (id)effectWillRenderPreviewWithOptions:(id)a3;
- (id)localAssetsWithFilteringOptions:(id)a3;
- (id)parameterForKey:(id)a3;
- (id)parametersClassWhitelist;
- (id)renderEffect;
- (id)requestAllAssetsWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5;
- (id)requestAllAssetsWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (id)requestAssetWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5;
- (id)requestAssetWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (id)requestPreviewingAssetsWithPriority:(int64_t)a3 onlyThumbnailAssetWhenAvailable:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6;
- (id)requestRenderingAssetsWithPriority:(int64_t)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (id)serializableEffectParameters;
- (int)type;
- (int64_t)playableAspectRatio;
- (int64_t)playableAspectRatioPreservationMode;
- (uint64_t)setTopLevelTransform:(__n128)a3 relativeTo:(uint64_t)a4 basisOrigin:(long long *)a5;
- (uint64_t)topLevelTransformRelativeTo:(void *)a1@<X0> basisOrigin:(_OWORD *)a2@<X8>;
- (unint64_t)contentAvailability;
- (unint64_t)hash;
- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6;
- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6;
- (void)_createCachedRenderEffect_noLock;
- (void)addEffectParameters:(id)a3;
- (void)cancelAssetRequest:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3;
- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4;
- (void)registerMotionDocumentWithinAssets:(id)a3;
- (void)removeEffectParameters:(id)a3;
- (void)removeTopLevelAdditionalScale;
- (void)setBuildInAnimation:(BOOL)a3;
- (void)setEffectParameters:(id)a3;
- (void)setForceDisableLooping:(BOOL)a3;
- (void)setForceRenderAtPosterFrame:(BOOL)a3;
- (void)setHDR:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setMotionDocumentFolderPath:(id)a3;
- (void)setOpacity:(float)a3;
- (void)setOutputAspect:(double)a3;
- (void)setParameter:(id)a3 forKey:(id)a4;
- (void)setParentTransformAnimation:(id)a3;
- (void)setPlayableAspectRatio:(int64_t)a3;
- (void)setPlayableAspectRatioPreservationMode:(int64_t)a3;
- (void)setRenderSize:(CGSize)a3;
- (void)setRenderStartOffset:(id *)a3;
- (void)setTopLevelAdditionalScale:(CGPoint)a3;
- (void)setTopLevelTransform:(_OWORD *)a3;
- (void)setTopLevelTransformObject:(id)a3;
- (void)setTransformAnimation:(id)a3;
- (void)topLevelTransform;
- (void)updatePriorityForAssetRequest:(id)a3 newPriority:(int64_t)a4;
@end

@implementation JFXEffect

+ (BOOL)effectIDIsNone:(id)a3
{
  return [MEMORY[0x263F61248] effectIDIsNone:a3];
}

+ (int64_t)defaultPlayableAspectRatio
{
  return 2;
}

+ (int64_t)defaultPlayableAspectRatioPreservationMode
{
  return 0;
}

- (void)dealloc
{
  [(NSLock *)self->_paramLock lock];
  renderEffect = self->_renderEffect;
  self->_renderEffect = 0;

  effectParameters = self->_effectParameters;
  self->_effectParameters = 0;

  dirtyEffectParameters = self->_dirtyEffectParameters;
  self->_dirtyEffectParameters = 0;

  [(NSLock *)self->_paramLock unlock];
  v6.receiver = self;
  v6.super_class = (Class)JFXEffect;
  [(JFXEffect *)&v6 dealloc];
}

- (JFXEffect)initWithEffectID:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)JFXEffect;
  objc_super v6 = [(JFXEffect *)&v17 init];
  if (v6)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    effectParameters = v6->_effectParameters;
    v6->_effectParameters = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dirtyEffectParameters = v6->_dirtyEffectParameters;
    v6->_dirtyEffectParameters = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    paramLock = v6->_paramLock;
    v6->_paramLock = v11;

    objc_storeStrong((id *)&v6->_effectID, a3);
    v6->_isNone = +[JFXEffect effectIDIsNone:v6->_effectID];
    v6->_renderSize = (CGSize)*MEMORY[0x263F001B0];
    -[JFXEffect setPlayableAspectRatio:](v6, "setPlayableAspectRatio:", [(id)objc_opt_class() defaultPlayableAspectRatio]);
    -[JFXEffect setPlayableAspectRatioPreservationMode:](v6, "setPlayableAspectRatioPreservationMode:", [(id)objc_opt_class() defaultPlayableAspectRatioPreservationMode]);
    if ([(JFXEffect *)v6 type] && ![(JFXEffect *)v6 isNone])
    {
      v13 = +[JFXEffectFactory sharedInstance];
      uint64_t v14 = objc_msgSend(v13, "createEffectContentDataSourceForEffectID:ofType:", v6->_effectID, -[JFXEffect type](v6, "type"));
      contentDataSource = v6->_contentDataSource;
      v6->_contentDataSource = (JFXEffectContentDataSource *)v14;
    }
    if ([(JFXEffect *)v6 loopedRangeRenderIsCacheable]) {
      [(JFXEffect *)v6 setParameter:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F61698]];
    }
    [(JFXEffect *)v6 setParameter:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F61748]];
  }

  return v6;
}

- (int)type
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(JFXEffect *)self effectID];
  uint64_t v6 = [v4 initWithEffectID:v5];

  [(JFXEffect *)self renderSize];
  objc_msgSend((id)v6, "setRenderSize:");
  [(NSLock *)self->_paramLock lock];
  [*(id *)(v6 + 48) lock];
  uint64_t v7 = [(NSMutableDictionary *)self->_effectParameters mutableDeepCopy];
  v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSMutableDictionary *)self->_dirtyEffectParameters mutableDeepCopy];
  v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  objc_storeStrong((id *)(v6 + 72), self->_motionDocumentFolderPath);
  [*(id *)(v6 + 48) unlock];
  [(NSLock *)self->_paramLock unlock];
  return (id)v6;
}

- (NSString)description
{
  v14.receiver = self;
  v14.super_class = (Class)JFXEffect;
  v3 = [(JFXEffect *)&v14 description];
  id v4 = NSString;
  id v5 = (void *)MEMORY[0x263F61248];
  uint64_t v6 = [(JFXEffect *)self effectID];
  uint64_t v7 = [v5 effectTypeForEffectID:v6];
  v8 = (void *)MEMORY[0x263F61248];
  uint64_t v9 = [(JFXEffect *)self effectID];
  v10 = [v8 displayNameForEffectID:v9];
  v11 = [v4 stringWithFormat:@" %@: %@", v7, v10];
  v12 = [v3 stringByAppendingString:v11];

  return (NSString *)v12;
}

- (unint64_t)contentAvailability
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (!v3) {
    return 0;
  }
  id v4 = [(JFXEffect *)self contentDataSource];
  unint64_t v5 = [v4 contentAvailability];

  return v5;
}

- (BOOL)isContentAvailable
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (!v3) {
    return 1;
  }
  id v4 = [(JFXEffect *)self contentDataSource];
  char v5 = [v4 isContentAvailable];

  return v5;
}

- (BOOL)isContentNew
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (!v3) {
    return 0;
  }
  id v4 = [(JFXEffect *)self contentDataSource];
  char v5 = [v4 isContentNew];

  return v5;
}

- (NSString)contentVersion
{
  v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    id v4 = [(JFXEffect *)self contentDataSource];
    char v5 = [v4 contentVersion];
  }
  else
  {
    char v5 = @"nodatasource";
  }
  return (NSString *)v5;
}

- (void)setHidden:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F616C0]];
}

- (void)setOpacity:(float)a3
{
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F617A8]];
}

- (float)opacity
{
  v3 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F617A8]];
  id v4 = v3;
  if (v3)
  {
    [v3 floatValue];
    float v6 = v5;
  }
  else
  {
    uint64_t v7 = [(JFXEffect *)self renderEffect];
    [v7 topLevelOpacity];
    float v6 = v8;
  }
  return v6;
}

- (BOOL)isHidden
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616C0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)enablePresentationState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(JFXEffect *)self forceRenderAtPosterFrame] ^ a3;
  if (v5)
  {
    float v6 = [NSNumber numberWithBool:v3];
    [(JFXEffect *)self setParameter:v6 forKey:*MEMORY[0x263F61700]];
  }
  return v5;
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F61700]];
}

- (BOOL)forceRenderAtPosterFrame
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61700]];
  BOOL v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setBuildInAnimation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F61748]];
}

- (BOOL)buildInAnimation
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61748]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)renderEffectResourcesAreReady
{
  v2 = [(JFXEffect *)self renderEffect];
  char v3 = [v2 resourcesAreReady];

  return v3;
}

- (BOOL)loopedRangeRenderIsCacheable
{
  return 0;
}

- (void)setRenderSize:(CGSize)a3
{
  if (self->_renderSize.width != a3.width || self->_renderSize.height != a3.height)
  {
    self->_renderSize = a3;
    BOOL v5 = a3.height == *(double *)(MEMORY[0x263F001B0] + 8) && a3.width == *MEMORY[0x263F001B0] || a3.height <= 0.0;
    double v6 = a3.width / a3.height;
    if (v5) {
      double v6 = 0.0;
    }
    [(JFXEffect *)self setOutputAspect:v6];
  }
}

- (double)outputAspect
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616E0]];
  char v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setOutputAspect:(double)a3
{
  if (fabs(a3) >= 0.0001)
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(JFXEffect *)self setParameter:v5 forKey:*MEMORY[0x263F616E0]];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x263F616E0];
    [(JFXEffect *)self setParameter:0 forKey:v4];
  }
}

- (BOOL)isConfiguredForOutputAspect:(double)a3
{
  if ([(JFXEffect *)self isNone]) {
    return 1;
  }
  double v6 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616E0]];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 doubleValue];
    BOOL v5 = vabdd_f64(a3, v8) < 0.0001;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isConfiguredForOutputAspectMatchingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(JFXEffect *)self isNone]) {
    return 1;
  }
  if (height <= 0.0) {
    return 0;
  }
  return [(JFXEffect *)self isConfiguredForOutputAspect:width / height];
}

- (int64_t)playableAspectRatio
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616F0]];
  char v3 = v2;
  if (v2)
  {
    [v2 doubleValue];
    unint64_t v5 = aspectRatioForMultiplier(v4);
  }
  else
  {
    unint64_t v5 = [(id)objc_opt_class() defaultPlayableAspectRatio];
  }
  int64_t v6 = v5;

  return v6;
}

- (void)setPlayableAspectRatio:(int64_t)a3
{
  id v4 = [NSNumber numberWithDouble:multiplierForAspectRatio(a3)];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F616F0]];
}

- (int64_t)playableAspectRatioPreservationMode
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616F8]];
  char v3 = v2;
  if (v2) {
    uint64_t v4 = aspectRatioPreservationModeFromPVViewContentMode([v2 integerValue]);
  }
  else {
    uint64_t v4 = [(id)objc_opt_class() defaultPlayableAspectRatioPreservationMode];
  }
  int64_t v5 = v4;

  return v5;
}

- (void)setPlayableAspectRatioPreservationMode:(int64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:PVViewContentModeFromAspectRatioPreservationMode(a3)];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F616F8]];
}

- (CGRect)playableRectInOutputSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(JFXEffect *)self playableAspectRatio];
  uint64_t v7 = [(JFXEffect *)self playableAspectRatioPreservationMode];
  double v8 = rectWithAspectRatioAndPreservationModeInRectWithSize(v6, v7, width, height);
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)playableScaleInOutputSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v6 = PVViewContentModeFromAspectRatioPreservationMode([(JFXEffect *)self playableAspectRatioPreservationMode]);
  double v7 = multiplierForAspectRatio([(JFXEffect *)self playableAspectRatio]);
  double v8 = 1.0;
  if (!v6) {
    goto LABEL_22;
  }
  if (v7 > -0.0000001)
  {
    double v8 = 1.0;
    if (v7 < 0.0000001) {
      goto LABEL_22;
    }
  }
  double v9 = height * v7;
  if (v6 > 2)
  {
    if (v6 == 3 || v6 == 13)
    {
      double v7 = width;
    }
    else if (v6 == 14)
    {
      double v7 = height * v7;
    }
    goto LABEL_21;
  }
  if (v6 == 1)
  {
    if (width <= height)
    {
      double v10 = height;
      if (v9 < width) {
        double v10 = width / v7;
      }
    }
    else
    {
      double v10 = width / v7;
      if (width / v7 < height) {
        double v10 = height;
      }
    }
    goto LABEL_20;
  }
  if (v6 == 2)
  {
    double v10 = width / v7;
    if (width / v7 > height) {
      double v10 = height;
    }
LABEL_20:
    double v7 = v7 * v10;
  }
LABEL_21:
  double v8 = v7 / v9;
LABEL_22:
  if (v8 >= 0.0000001 || v8 <= -0.0000001) {
    return v8;
  }
  else {
    return 1.0;
  }
}

- (void)setForceDisableLooping:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F61758]];
}

- (BOOL)forceDisableLooping
{
  v2 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61758]];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)accessibilityName
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    char v4 = [(JFXEffect *)self contentDataSource];
    int64_t v5 = [v4 localizedAccessibilityName];
  }
  else
  {
    char v4 = [(NSString *)self->_effectID stringByAppendingString:@"_Accessibility Name"];
    int v6 = [MEMORY[0x263F086E0] jfxBundle];
    double v7 = [v6 localizedStringForKey:v4 value:&stru_26E7CDB50 table:0];

    if ([v7 length] && !objc_msgSend(v7, "isEqualToString:", v4))
    {
      id v10 = v7;
    }
    else
    {
      double v8 = JFXLog_pickerUI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        effectID = self->_effectID;
        int v12 = 138412290;
        v13 = effectID;
        _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "Missing accessibility name for effect: %@", (uint8_t *)&v12, 0xCu);
      }

      id v10 = [(JFXEffect *)self displayName];
    }
    int64_t v5 = v10;
  }
  return v5;
}

- (id)displayName
{
  if ([(JFXEffect *)self isNone])
  {
    char v3 = [MEMORY[0x263F086E0] jfxBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"None_Effect_Display Name" value:&stru_26E7CDB50 table:0];
LABEL_5:
    int v6 = (void *)v4;
    goto LABEL_7;
  }
  int64_t v5 = [(JFXEffect *)self contentDataSource];

  if (v5)
  {
    char v3 = [(JFXEffect *)self contentDataSource];
    uint64_t v4 = [v3 localizedDisplayName];
    goto LABEL_5;
  }
  char v3 = [(NSString *)self->_effectID stringByAppendingString:@"_Display Name"];
  double v7 = [MEMORY[0x263F086E0] jfxBundle];
  int v6 = [v7 localizedStringForKey:v3 value:&stru_26E7CDB50 table:0];

LABEL_7:
  return v6;
}

- (void)setRenderStartOffset:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  uint64_t v4 = [MEMORY[0x263F08D40] valueWithCMTime:&v5];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F61708]];
}

- ($70930193D4F448A53BB9343C0237EB5F)rangeForPresentationRange:(SEL)a3
{
  long long v4 = *(_OWORD *)&a4->var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&a4->var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v4;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&a4->var1.var1;
  return self;
}

- (BOOL)isEqual:(id)a3
{
  long long v4 = (JFXEffect *)a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v6 = v5;
        double v7 = [(JFXEffect *)self effectID];
        double v8 = [(JFXEffect *)v6 effectID];
        if ([v7 isEqualToString:v8])
        {
          int v9 = [(JFXEffect *)self type];
          int v10 = [(JFXEffect *)v6 type];

          if (v9 != v10)
          {
            char v11 = 0;
            goto LABEL_12;
          }
          double v7 = [(JFXEffect *)v6 effectParameters];
          [(NSLock *)self->_paramLock lock];
          char v11 = [(NSMutableDictionary *)self->_effectParameters isEqual:v7];
          [(NSLock *)self->_paramLock unlock];
        }
        else
        {

          char v11 = 0;
        }

LABEL_12:
        goto LABEL_13;
      }
    }
    char v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * [(JFXEffect *)self type];
  [(NSLock *)self->_paramLock lock];
  long long v4 = [(JFXEffect *)self effectID];
  uint64_t v5 = [v4 hash] ^ v3;
  unint64_t v6 = v5 ^ [(NSMutableDictionary *)self->_effectParameters hash];

  [(NSLock *)self->_paramLock unlock];
  return v6;
}

- (BOOL)isAppearanceEqual:(id)a3
{
  return [(JFXEffect *)self isAppearanceEqual:a3 forPurpose:0];
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v5 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unint64_t v6 = [(JFXEffect *)self effectID];
    double v7 = [v5 effectID];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setEffectParameters:(id)a3
{
  id v8 = a3;
  [(NSLock *)self->_paramLock lock];
  if (v8)
  {
    long long v4 = (NSMutableDictionary *)[v8 mutableCopy];
    effectParameters = self->_effectParameters;
    self->_effectParameters = v4;

    unint64_t v6 = (NSMutableDictionary *)[v8 mutableCopy];
    dirtyEffectParameters = self->_dirtyEffectParameters;
    self->_dirtyEffectParameters = v6;
  }
  else
  {
    [(NSMutableDictionary *)self->_effectParameters removeAllObjects];
    [(NSMutableDictionary *)self->_dirtyEffectParameters removeAllObjects];
  }
  [(NSLock *)self->_paramLock unlock];
}

- (void)addEffectParameters:(id)a3
{
  if (a3)
  {
    paramLock = self->_paramLock;
    id v5 = a3;
    [(NSLock *)paramLock lock];
    [(NSMutableDictionary *)self->_effectParameters addEntriesFromDictionary:v5];
    [(NSMutableDictionary *)self->_dirtyEffectParameters addEntriesFromDictionary:v5];

    unint64_t v6 = self->_paramLock;
    [(NSLock *)v6 unlock];
  }
}

- (void)removeEffectParameters:(id)a3
{
  if (a3)
  {
    paramLock = self->_paramLock;
    id v5 = a3;
    [(NSLock *)paramLock lock];
    [(NSMutableDictionary *)self->_effectParameters removeObjectsForKeys:v5];
    [(NSMutableDictionary *)self->_dirtyEffectParameters removeObjectsForKeys:v5];

    unint64_t v6 = self->_paramLock;
    [(NSLock *)v6 unlock];
  }
}

- (NSDictionary)effectParameters
{
  [(NSLock *)self->_paramLock lock];
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_effectParameters copy];
  [(NSLock *)self->_paramLock unlock];
  return (NSDictionary *)v3;
}

- (void)setParameter:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(NSLock *)self->_paramLock lock];
  if (v9)
  {
    double v7 = [(NSMutableDictionary *)self->_effectParameters objectForKeyedSubscript:v6];
    id v8 = v7;
    if (!v7 || ([v7 isEqual:v9] & 1) == 0)
    {
      [(NSMutableDictionary *)self->_effectParameters setObject:v9 forKeyedSubscript:v6];
      [(NSMutableDictionary *)self->_dirtyEffectParameters setObject:v9 forKeyedSubscript:v6];
    }
  }
  else
  {
    [(NSMutableDictionary *)self->_dirtyEffectParameters removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_effectParameters removeObjectForKey:v6];
  }
  [(NSLock *)self->_paramLock unlock];
}

- (id)parameterForKey:(id)a3
{
  paramLock = self->_paramLock;
  id v5 = a3;
  [(NSLock *)paramLock lock];
  id v6 = [(NSMutableDictionary *)self->_effectParameters objectForKeyedSubscript:v5];

  [(NSLock *)self->_paramLock unlock];
  return v6;
}

- (BOOL)loadRenderEffect
{
  [(JFXEffect *)self renderEffectWillLoad];
  uint64_t v3 = [(JFXEffect *)self renderEffect];
  char v4 = [v3 loadResources];

  return v4;
}

- (void)loadRenderEffectInBackgroundWithCompletionOnMainQueue:(id)a3
{
  id v4 = a3;
  [(JFXEffect *)self renderEffectWillLoad];
  id v5 = [(JFXEffect *)self renderEffect];
  if (v5)
  {
    id v6 = dispatch_get_global_queue(25, 0);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke;
    v12[3] = &unk_264C0B058;
    double v7 = &v13;
    id v13 = v4;
    id v8 = v4;
    [v5 loadResourcesOnQueue:v6 completion:v12];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_3;
    v10[3] = &unk_264C0A3F0;
    double v7 = &v11;
    id v11 = v4;
    id v9 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

void __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_2;
  v3[3] = &unk_264C0B030;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

uint64_t __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __67__JFXEffect_loadRenderEffectInBackgroundWithCompletionOnMainQueue___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)loadRenderEffectOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = a3;
  [(JFXEffect *)self renderEffectWillLoad];
  id v8 = [(JFXEffect *)self renderEffect];
  if (v8)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke;
    v14[3] = &unk_264C0B058;
    id v9 = &v15;
    id v15 = v6;
    id v10 = v6;
    [v8 loadResourcesOnQueue:v7 completion:v14];
  }
  else
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke_2;
    v12[3] = &unk_264C0A3F0;
    id v9 = &v13;
    id v13 = v6;
    id v11 = v6;
    dispatch_async(v7, v12);
  }
}

uint64_t __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__JFXEffect_loadRenderEffectOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)renderEffect
{
  [(NSLock *)self->_paramLock lock];
  [(JFXEffect *)self _createCachedRenderEffect_noLock];
  [(PVEffect *)self->_renderEffect setInspectableProperties:self->_effectParameters];
  if ([(NSMutableDictionary *)self->_dirtyEffectParameters count])
  {
    [(PVEffect *)self->_renderEffect updateInspectableProperties:self->_dirtyEffectParameters];
    [(NSMutableDictionary *)self->_dirtyEffectParameters removeAllObjects];
  }
  [(NSLock *)self->_paramLock unlock];
  renderEffect = self->_renderEffect;
  return renderEffect;
}

- (void)setHDR:(BOOL)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F61688];
  if (a3)
  {
    [(JFXEffect *)self setParameter:@"1" forKey:v4];
  }
  else
  {
    v6[0] = *MEMORY[0x263F61688];
    char v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    [(JFXEffect *)self removeEffectParameters:v5];
  }
}

- (void)setMotionDocumentFolderPath:(id)a3
{
  id v11 = a3;
  [(NSLock *)self->_paramLock lock];
  if (![(NSString *)self->_motionDocumentFolderPath isEqualToString:v11])
  {
    objc_storeStrong((id *)&self->_motionDocumentFolderPath, a3);
    renderEffect = self->_renderEffect;
    self->_renderEffect = 0;

    id v6 = [MEMORY[0x263F61240] sharedInstance];
    double v7 = [(JFXEffect *)self effectID];
    int v8 = [v6 isContentIDRegistered:v7];

    if (v8)
    {
      id v9 = [MEMORY[0x263F61240] sharedInstance];
      id v10 = [(JFXEffect *)self effectID];
      [v9 unregisterContentID:v10];
    }
  }
  [(NSLock *)self->_paramLock unlock];
}

- (void)_createCachedRenderEffect_noLock
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if (!self->_renderEffect)
  {
    uint64_t v3 = [(JFXEffect *)self motionDocumentFolderPath];
    unint64_t v4 = 0x263F61000uLL;
    if (v3) {
      goto LABEL_5;
    }
    uint64_t v3 = [(JFXEffect *)self JFX_defaultMotionDocumentFolderLocalURL];
    if (v3) {
      goto LABEL_5;
    }
    char v5 = [MEMORY[0x263F61240] sharedInstance];
    id v6 = [(JFXEffect *)self effectID];
    uint64_t v3 = [v5 contentPathForID:v6];

    if (v3)
    {
LABEL_5:
      double v7 = [MEMORY[0x263F61240] sharedInstance];
      int v8 = [(JFXEffect *)self effectID];
      char v9 = [v7 isContentIDRegistered:v8];

      if ((v9 & 1) == 0)
      {
        id v10 = [MEMORY[0x263F08850] defaultManager];
        id v11 = [v10 contentsOfDirectoryAtPath:v3 error:0];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
        id v14 = v12;
        if (v13)
        {
          uint64_t v15 = v13;
          uint64_t v16 = *(void *)v35;
LABEL_8:
          uint64_t v17 = 0;
          while (1)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v12);
            }
            v18 = *(void **)(*((void *)&v34 + 1) + 8 * v17);
            v19 = objc_msgSend(v18, "pathExtension", (void)v34);
            if (([v19 isEqualToString:@"moti"] & 1) != 0
              || ([v19 isEqualToString:@"moef"] & 1) != 0)
            {
              break;
            }

            if (v15 == ++v17)
            {
              uint64_t v15 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
              if (v15) {
                goto LABEL_8;
              }
              id v14 = v12;
              unint64_t v4 = 0x263F61000;
              goto LABEL_18;
            }
          }
          id v14 = v18;

          unint64_t v4 = 0x263F61000uLL;
          if (!v14) {
            goto LABEL_19;
          }
          v20 = [v3 stringByAppendingPathComponent:v14];
          v21 = [MEMORY[0x263F61240] sharedInstance];
          v22 = [(JFXEffect *)self effectID];
          v23 = [(JFXEffect *)self contentProperties];
          [v21 registerContentFile:v20 forID:v22 properties:v23];
        }
LABEL_18:

LABEL_19:
      }
      v24 = objc_msgSend(*(id *)(v4 + 576), "sharedInstance", (void)v34);
      v25 = [(JFXEffect *)self effectID];
      v26 = [v24 createContentInstance:v25];
      renderEffect = self->_renderEffect;
      self->_renderEffect = v26;
    }
    else
    {
      uint64_t v28 = [(JFXEffect *)self contentDataSource];
      if (!v28
        || (v29 = (void *)v28,
            [(JFXEffect *)self contentDataSource],
            v30 = objc_claimAutoreleasedReturnValue(),
            char v31 = [v30 isContentAvailable],
            v30,
            v29,
            (v31 & 1) == 0))
      {
        v32 = (PVEffect *)[MEMORY[0x263F61248] newEffectWithID:self->_effectID];
        v33 = self->_renderEffect;
        self->_renderEffect = v32;
      }
    }
    [(NSMutableDictionary *)self->_dirtyEffectParameters addEntriesFromDictionary:self->_effectParameters];
  }
}

- (id)contentProperties
{
  v6[1] = *MEMORY[0x263EF8340];
  char v5 = @"effectType";
  v2 = NSStringFromJFXEffectType([(JFXEffect *)self type]);
  v6[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (PVCGPointQuad)_convertRenderEffectPoints:(SEL)a3 toBasisRect:(PVCGPointQuad *)a4 basisOrigin:(CGRect)a5
{
  double v7 = [(JFXEffect *)self renderEffect];
  [v7 outputSize];

  int v8 = [(JFXEffect *)self renderEffect];
  [v8 origin];

  return (PVCGPointQuad *)pv_transform_PVCGPointQuad_between_coordinate_systems();
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 toBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v12 = [(JFXEffect *)self renderEffect];
  [v12 outputSize];
  double v14 = v13;
  double v31 = v15;

  uint64_t v16 = [(JFXEffect *)self renderEffect];
  int v17 = [v16 origin];

  if (a4)
  {
    unint64_t v18 = 0;
    double v20 = *MEMORY[0x263F00148];
    double v19 = *(double *)(MEMORY[0x263F00148] + 8);
    double v30 = v14 * 0.5;
    double v29 = v14 * -0.5;
    double v21 = width / v14;
    unsigned int v22 = 1;
    double v23 = height / v31;
    do
    {
      v24 = &a3[v18];
      double y = v24->y;
      double x = v24->x;
      if (v17 == 2)
      {
        CGFloat v28 = v30;
        double v27 = v31 * 0.5;
        if (a6 == 1) {
          goto LABEL_16;
        }
        double v25 = v19;
        CGFloat v26 = v20;
        if (!a6)
        {
          CGFloat v26 = v30;
          double v25 = v31 * 0.5;
        }
      }
      else if (v17 == 1)
      {
        double v27 = v31;
        CGFloat v28 = v20;
        if (!a6 || (v27 = v31 * 0.5, CGFloat v28 = v29, v25 = v19, v26 = v20, a6 == 2))
        {
LABEL_16:
          memset(&v34, 0, sizeof(v34));
          CGAffineTransformMakeScale(&v34, v21, v23);
          CGAffineTransform v35 = v34;
          CGAffineTransformTranslate(&v36, &v35, v28, v27);
          CGAffineTransform v34 = v36;
          CGAffineTransform v35 = v36;
          CGAffineTransformScale(&v36, &v35, 1.0, -1.0);
          goto LABEL_17;
        }
      }
      else
      {
        double v25 = v19;
        CGFloat v26 = v20;
        if (!v17)
        {
          double v27 = v31;
          CGFloat v28 = v20;
          if (a6 == 1) {
            goto LABEL_16;
          }
          double v25 = v19;
          CGFloat v26 = v20;
          if (a6 == 2)
          {
            double v25 = v31 * -0.5;
            CGFloat v26 = v29;
          }
        }
      }
      memset(&v34, 0, sizeof(v34));
      CGAffineTransformMakeScale(&v34, v21, v23);
      CGAffineTransform v35 = v34;
      CGAffineTransformTranslate(&v36, &v35, v26, v25);
LABEL_17:
      CGAffineTransform v34 = v36;
      *(float64x2_t *)v24 = vaddq_f64(*(float64x2_t *)&v36.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v36.c, y), *(float64x2_t *)&v36.a, x));
      unint64_t v18 = v22++;
    }
    while (v18 < a4);
  }
}

- (void)_convertRenderEffectPoints:(CGPoint *)a3 numPoints:(unint64_t)a4 fromBasisRect:(CGRect)a5 basisOrigin:(int)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v12 = [(JFXEffect *)self renderEffect];
  int v13 = [v12 origin];

  double v14 = [(JFXEffect *)self renderEffect];
  [v14 outputSize];
  double v16 = v15;
  double v18 = v17;

  if (a6 <= 1 && v13 == 2 && a4)
  {
    double v19 = height * 0.5;
    p_double y = &a3->y;
    unint64_t v21 = a4;
    do
    {
      *(p_y - 1) = *(p_y - 1) - width * 0.5;
      if (a6) {
        double v22 = v19 - *p_y;
      }
      else {
        double v22 = v19 + *p_y;
      }
      *p_double y = v22;
      p_y += 2;
      --v21;
    }
    while (v21);
  }
  double v23 = v16 / width;
  double v24 = v18 / height;
  if ((v24 != 1.0 || v23 != 1.0) && a4 != 0)
  {
    unint64_t v27 = 0;
    unsigned int v28 = 1;
    do
    {
      double v29 = &a3[v27];
      CGAffineTransformMakeScale(&v30, v23, v24);
      *(float64x2_t *)double v29 = vaddq_f64(*(float64x2_t *)&v30.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v30.c, v29->y), *(float64x2_t *)&v30.a, v29->x));
      unint64_t v27 = v28++;
    }
    while (v27 < a4);
  }
}

- (CGAffineTransform)_affineTransformFromEffectRect:(SEL)a3 toSize:(CGRect)a4 basisOrigin:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  int v13 = [(JFXEffect *)self renderEffect];
  int v14 = [v13 origin];

  double v15 = [(JFXEffect *)self renderEffect];
  [v15 outputSize];
  double v17 = v16;
  double v19 = v18;

  double v21 = 0.0;
  double v22 = v10 * 0.5;
  double v23 = v9 * 0.5;
  double v24 = v9 * -0.5 + 0.0;
  if (a6 != 1) {
    double v24 = 0.0;
  }
  if (a6) {
    double v23 = v24;
  }
  if (v14 != 2)
  {
    double v22 = 0.0;
    double v23 = 0.0;
  }
  if (a6 <= 1) {
    double v21 = v23;
  }
  else {
    double v22 = 0.0;
  }
  retstr->a = v17 / width;
  retstr->b = 0.0;
  retstr->c = 0.0;
  retstr->d = v19 / height;
  retstr->tdouble x = v22;
  retstr->tdouble y = v21;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)JFXEffect;
  char v5 = [(JFXEffect *)&v27 init];
  if (v5)
  {
    [MEMORY[0x263F08928] setClass:objc_opt_class() forClassName:@"PCMatrix44Double"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JTEffectEffectIDCoderKey"];
    effectID = v5->_effectID;
    v5->_effectID = (NSString *)v6;

    v5->_isNone = +[JFXEffect effectIDIsNone:v5->_effectID];
    int v8 = [(JFXEffect *)v5 parametersClassWhitelist];
    id v26 = 0;
    double v9 = [v4 decodeTopLevelObjectOfClasses:v8 forKey:@"JTEffectEffectParameterCoderKey" error:&v26];
    id v10 = v26;
    uint64_t v11 = [v9 mutableCopy];
    effectParameters = v5->_effectParameters;
    v5->_effectParameters = (NSMutableDictionary *)v11;

    if (v10)
    {
      uint64_t v13 = objc_opt_new();
      int v14 = v5->_effectParameters;
      v5->_effectParameters = (NSMutableDictionary *)v13;

      double v15 = JFXLog_core();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[JFXEffect initWithCoder:]((uint64_t)v10, v15);
      }
    }
    uint64_t v16 = objc_opt_new();
    dirtyEffectParameters = v5->_dirtyEffectParameters;
    v5->_dirtyEffectParameters = (NSMutableDictionary *)v16;

    double v18 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    paramLock = v5->_paramLock;
    v5->_paramLock = v18;

    if ([(JFXEffect *)v5 type] && ![(JFXEffect *)v5 isNone])
    {
      double v20 = +[JFXEffectFactory sharedInstance];
      uint64_t v21 = objc_msgSend(v20, "createEffectContentDataSourceForEffectID:ofType:", v5->_effectID, -[JFXEffect type](v5, "type"));
      contentDataSource = v5->_contentDataSource;
      v5->_contentDataSource = (JFXEffectContentDataSource *)v21;
    }
    double v23 = [(JFXEffect *)v5 parameterForKey:*MEMORY[0x263F616F0]];

    if (!v23) {
      -[JFXEffect setPlayableAspectRatio:](v5, "setPlayableAspectRatio:", [(id)objc_opt_class() defaultPlayableAspectRatio]);
    }
    double v24 = [(JFXEffect *)v5 parameterForKey:*MEMORY[0x263F616F8]];

    if (!v24) {
      -[JFXEffect setPlayableAspectRatioPreservationMode:](v5, "setPlayableAspectRatioPreservationMode:", [(id)objc_opt_class() defaultPlayableAspectRatioPreservationMode]);
    }
    if ([(JFXEffect *)v5 loopedRangeRenderIsCacheable]) {
      [(JFXEffect *)v5 setParameter:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F61698]];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  effectID = self->_effectID;
  id v5 = a3;
  [v5 encodeObject:effectID forKey:@"JTEffectEffectIDCoderKey"];
  id v6 = [(JFXEffect *)self serializableEffectParameters];
  [v5 encodeObject:v6 forKey:@"JTEffectEffectParameterCoderKey"];
}

- (id)parametersClassWhitelist
{
  if (parametersClassWhitelist_onceToken != -1) {
    dispatch_once(&parametersClassWhitelist_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)parametersClassWhitelist_parametersClassWhitelist;
  return v2;
}

void __37__JFXEffect_parametersClassWhitelist__block_invoke()
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v4 count:13];
  uint64_t v2 = objc_msgSend(v0, "setWithArray:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  uint64_t v3 = (void *)parametersClassWhitelist_parametersClassWhitelist;
  parametersClassWhitelist_parametersClassWhitelist = v2;
}

- (id)serializableEffectParameters
{
  uint64_t v2 = [(JFXEffect *)self effectParameters];
  uint64_t v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:*MEMORY[0x263F616E0]];
  [v3 removeObjectForKey:*MEMORY[0x263F61748]];
  [v3 removeObjectForKey:*MEMORY[0x263F61758]];
  [v3 removeObjectForKey:*MEMORY[0x263F61700]];
  [v3 removeObjectForKey:*MEMORY[0x263F616C8]];
  [v3 removeObjectForKey:*MEMORY[0x263F616A0]];
  [v3 removeObjectForKey:*MEMORY[0x263F61698]];
  [v3 removeObjectForKey:*MEMORY[0x263F61738]];
  [v3 removeObjectForKey:*MEMORY[0x263F617A0]];
  return v3;
}

- (PVMatrix44Double)topLevelTransformObject
{
  return (PVMatrix44Double *)[(JFXEffect *)self parameterForKey:*MEMORY[0x263F617B0]];
}

- (void)setTopLevelTransformObject:(id)a3
{
}

- (void)topLevelTransform
{
  uint64_t v3 = [a1 topLevelTransformObject];
  if (v3)
  {
    uint64_t v9 = v3;
    [v3 SIMDDouble4x4];
    uint64_t v3 = v9;
  }
  else
  {
    uint64_t v4 = (_OWORD *)MEMORY[0x263EF8990];
    long long v5 = *(_OWORD *)(MEMORY[0x263EF8990] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x263EF8990] + 64);
    a2[5] = v5;
    long long v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    long long v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    long long v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }
}

- (void)setTopLevelTransform:(_OWORD *)a3
{
  long long v4 = a3[5];
  v9[4] = a3[4];
  v9[5] = v4;
  long long v5 = a3[7];
  v9[6] = a3[6];
  v9[7] = v5;
  long long v6 = a3[1];
  v9[0] = *a3;
  v9[1] = v6;
  long long v7 = a3[3];
  v9[2] = a3[2];
  v9[3] = v7;
  long long v8 = [MEMORY[0x263F612E0] matrixWithSIMDDouble4x4:v9];
  [a1 setTopLevelTransformObject:v8];
}

- (uint64_t)topLevelTransformRelativeTo:(void *)a1@<X0> basisOrigin:(_OWORD *)a2@<X8>
{
  [a1 topLevelTransform];
  long long v4 = [a1 renderEffect];
  [v4 origin];

  long long v5 = [a1 renderEffect];
  [v5 outputSize];

  a2[6] = 0u;
  a2[7] = 0u;
  a2[4] = 0u;
  a2[5] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  *a2 = 0u;
  a2[1] = 0u;
  return pv_simd_matrix_convert_coordinate_system();
}

- (uint64_t)setTopLevelTransform:(__n128)a3 relativeTo:(uint64_t)a4 basisOrigin:(long long *)a5
{
  CGAffineTransform v36 = [a1 renderEffect];
  [v36 origin];

  long long v37 = [a1 renderEffect];
  [v37 outputSize];

  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  a29 = 0u;
  a30 = 0u;
  a27 = 0u;
  a28 = 0u;
  long long v38 = a5[5];
  a23 = a5[4];
  a24 = v38;
  long long v39 = a5[7];
  a25 = a5[6];
  a26 = v39;
  long long v40 = a5[1];
  a19 = *a5;
  a20 = v40;
  long long v41 = a5[3];
  a21 = a5[2];
  a22 = v41;
  pv_simd_matrix_convert_coordinate_system();
  a15 = a31;
  a16 = a32;
  a17 = a33;
  a18 = a34;
  a11 = a27;
  a12 = a28;
  a13 = a29;
  a14 = a30;
  return [a1 setTopLevelTransform:&a11];
}

- (PVTransformAnimation)transformAnimation
{
  return (PVTransformAnimation *)[(JFXEffect *)self parameterForKey:*MEMORY[0x263F617B8]];
}

- (void)setTransformAnimation:(id)a3
{
}

- (void)setParentTransformAnimation:(id)a3
{
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6
{
  long long v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  return -[JFXEffect addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:", v10, &v9, *(void *)&a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 ignoreTranslation:(int)a7
{
  BOOL v8 = a8;
  double height = a6.size.height;
  double width = a6.size.width;
  uint64_t v16 = [(JFXEffect *)self renderEffect];
  [v16 outputSize];
  double v18 = v17;
  double v20 = v19;

  uint64_t v21 = [(JFXEffect *)self renderEffect];
  int v22 = [v21 origin];

  long long v24 = *(_OWORD *)&a4->a;
  long long v23 = *(_OWORD *)&a4->c;
  p_tdouble y = &a4->ty;
  long long v27 = *(_OWORD *)&a4->tx;
  p_tdouble x = &a4->tx;
  long long v55 = *(_OWORD *)(MEMORY[0x263F617E0] + 80);
  int8x16_t v56 = *(int8x16_t *)(MEMORY[0x263F617E0] + 64);
  int8x16_t v82 = v56;
  long long v83 = v55;
  long long v53 = *(_OWORD *)(MEMORY[0x263F617E0] + 112);
  long long v54 = *(_OWORD *)(MEMORY[0x263F617E0] + 96);
  long long v84 = v54;
  long long v85 = v53;
  long long v51 = *(_OWORD *)(MEMORY[0x263F617E0] + 16);
  long long v52 = *MEMORY[0x263F617E0];
  *(_OWORD *)&v80.CGFloat a = *MEMORY[0x263F617E0];
  *(_OWORD *)&v80.c = v51;
  long long v49 = *(_OWORD *)(MEMORY[0x263F617E0] + 48);
  long long v50 = *(_OWORD *)(MEMORY[0x263F617E0] + 32);
  *(_OWORD *)&v80.tdouble x = v50;
  long long v81 = v49;
  *(_OWORD *)&v74.c = 0u;
  __double x = v24;
  *(_OWORD *)&v74.CGFloat a = v24;
  long long v75 = 0u;
  *(_OWORD *)&v74.tdouble x = v23;
  long long v77 = xmmword_234D61140;
  long long v76 = 0u;
  long long v79 = xmmword_234D61130;
  long long v78 = v27;
  pv_transform_info_make();
  if (v8) {
    unsigned int v28 = (double *)MEMORY[0x263F001B0];
  }
  else {
    unsigned int v28 = p_tx;
  }
  double v29 = *MEMORY[0x263F001B0];
  CGAffineTransform v30 = (double *)(MEMORY[0x263F001B0] + 8);
  int8x16_t v59 = v82;
  int8x16_t v58 = vextq_s8(v82, v82, 8uLL);
  if (!v8) {
    CGAffineTransform v30 = p_ty;
  }
  double v31 = *v30;
  double v32 = *v28;
  BOOL v33 = *(double *)(MEMORY[0x263F001B0] + 8) == *v30 && v29 == v32;
  if (!v33 && !v8)
  {
    CGAffineTransform v34 = [(JFXEffect *)self transformAnimation];
    CGAffineTransform v35 = v34;
    if (v34)
    {
      *(void *)&long long v81 = 0;
      memset(&v80, 0, sizeof(v80));
      *(_OWORD *)&v74.CGFloat a = *(_OWORD *)&a5->var0;
      *(void *)&v74.c = a5->var3;
      [v34 transformInfoAtTime:&v74];
      CGAffineTransform v74 = v80;
      *(void *)&long long v75 = v81;
      if ((PVTransformAnimationInfoIsIdentity() & 1) == 0)
      {
        double v32 = v32 / v80.ty;
        double v31 = v31 / v80.ty;
      }
    }
    -[JFXEffect playableScaleInOutputSize:](self, "playableScaleInOutputSize:", width, height, v49, v50, v51, v52, v53, v54, v55, *(_OWORD *)&v56, __x, *(_OWORD *)&v58, *(_OWORD *)&v59);
    BOOL v37 = fabs(v36 + -1.0) < 0.0001;
    double v38 = v32 / v36;
    double v39 = v31 / v36;
    if (v37) {
      double v40 = v32;
    }
    else {
      double v40 = v38;
    }
    if (!v37) {
      double v31 = v39;
    }
    if (a7 != 2)
    {
      if (a7 == 1)
      {
        BOOL v41 = (v22 & 0xFFFFFFFD) == 0;
        goto LABEL_24;
      }
      if (a7)
      {
        memset(&v86, 0, sizeof(v86));
        CGAffineTransformMakeScale(&v86, v18 / width, v20 / height);
LABEL_30:
        double v32 = v31 * v86.c + v86.a * v40;
        double v31 = v31 * v86.d + v86.b * v40;

        goto LABEL_31;
      }
    }
    BOOL v41 = v22 == 1;
LABEL_24:
    int v42 = v41;
    memset(&v86, 0, sizeof(v86));
    CGAffineTransformMakeScale(&v86, v18 / width, v20 / height);
    if (v42)
    {
      CGAffineTransform v74 = v86;
      CGAffineTransformScale(&v80, &v74, 1.0, -1.0);
      CGAffineTransform v86 = v80;
    }
    goto LABEL_30;
  }
LABEL_31:
  double v43 = atan2(*((long double *)&__x + 1), *(long double *)&__x);
  int8x16_t v82 = v56;
  long long v83 = v55;
  long long v84 = v54;
  long long v85 = v53;
  *(_OWORD *)&v80.CGFloat a = v52;
  *(_OWORD *)&v80.c = v51;
  *(_OWORD *)&v80.tdouble x = v50;
  long long v81 = v49;
  [(JFXEffect *)self topLevelTransform];
  pv_transform_info_make();
  memset(&v74, 0, sizeof(v74));
  CGFloat a = v80.a;
  CGFloat b = v80.b;
  CGAffineTransformMakeTranslation(&v74, -v80.a, -v80.b);
  memset(&v86, 0, sizeof(v86));
  CGAffineTransformMakeTranslation(&v86, v32, v31);
  memset(&v73, 0, sizeof(v73));
  CGAffineTransformMakeRotation(&v73, -v43);
  memset(&v72, 0, sizeof(v72));
  CGAffineTransformMakeScale(&v72, *(CGFloat *)v59.i64, *(CGFloat *)v58.i64);
  memset(&v71, 0, sizeof(v71));
  CGAffineTransformMakeTranslation(&v71, a, b);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->CGFloat a = 0u;
  [(JFXEffect *)self topLevelTransform];
  *(_OWORD *)&v70.CGFloat a = v67;
  *(_OWORD *)&v70.c = v68;
  *(_OWORD *)&v70.tdouble x = v69;
  CGAffineTransform t1 = v72;
  CGAffineTransform t2 = v71;
  CGAffineTransformConcat(&v63, &t1, &t2);
  CGAffineTransform t1 = v73;
  CGAffineTransformConcat(&v64, &t1, &v63);
  CGAffineTransform t1 = v86;
  CGAffineTransformConcat(&v65, &t1, &v64);
  CGAffineTransform t1 = v74;
  CGAffineTransformConcat(&v66, &t1, &v65);
  CGAffineTransformConcat(retstr, &v70, &v66);
  long long v46 = *(_OWORD *)&retstr->c;
  long long v47 = *(_OWORD *)&retstr->tx;
  v60[0] = *(_OWORD *)&retstr->a;
  v60[1] = 0u;
  v60[2] = v46;
  memset(&v60[3], 0, 32);
  v60[5] = xmmword_234D61140;
  v60[6] = v47;
  v60[7] = xmmword_234D61130;
  return (CGAffineTransform *)[(JFXEffect *)self setTopLevelTransform:v60];
}

- (void)setTopLevelAdditionalScale:(CGPoint)a3
{
  objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", a3.x, a3.y);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F617A0]];
}

- (void)removeTopLevelAdditionalScale
{
}

- (id)JFX_defaultMotionDocumentFolderLocalURL
{
  uint64_t v3 = [(JFXEffect *)self contentDataSource];

  if (v3
    && ([(JFXEffect *)self contentDataSource],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_26E82BD38],
        v4,
        v5))
  {
    long long v6 = objc_opt_new();
    [v6 setContentType:5];
    long long v7 = [(JFXEffect *)self contentDataSource];
    BOOL v8 = [v7 localAssetsWithFilteringOptions:v6];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v8 firstObject];

    uint64_t v10 = [v9 localURL];
    uint64_t v11 = [v10 path];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (NSString)effectID
{
  return self->_effectID;
}

- (BOOL)isNone
{
  return self->_isNone;
}

- (CGSize)renderSize
{
  double width = self->_renderSize.width;
  double height = self->_renderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (JFXEffectContentDataSource)contentDataSource
{
  return self->_contentDataSource;
}

- (NSString)motionDocumentFolderPath
{
  return self->_motionDocumentFolderPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionDocumentFolderPath, 0);
  objc_storeStrong((id *)&self->_contentDataSource, 0);
  objc_storeStrong((id *)&self->_paramLock, 0);
  objc_storeStrong((id *)&self->_dirtyEffectParameters, 0);
  objc_storeStrong((id *)&self->_effectParameters, 0);
  objc_storeStrong((id *)&self->_renderEffect, 0);
  objc_storeStrong((id *)&self->_effectID, 0);
}

- (id)requestAllAssetsWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(JFXEffect *)self contentDataSource];
  char v12 = [v11 conformsToProtocol:&unk_26E82BD38];

  if (v12)
  {
    uint64_t v13 = [(JFXEffect *)self contentDataSource];
    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__23;
    double v25 = __Block_byref_object_dispose__23;
    id v26 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __108__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressAndCancellationHandler_completionHandler___block_invoke;
    v18[3] = &unk_264C0CE98;
    id v19 = v9;
    double v20 = &v21;
    v18[4] = self;
    uint64_t v14 = [v13 requestAllAssetsWithOptions:v8 progressHandler:v18 completionHandler:v10];
    uint64_t v15 = (void *)v22[5];
    v22[5] = v14;

    id v16 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    id v16 = 0;
  }

  return v16;
}

uint64_t __108__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressAndCancellationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v3);
    if (v3)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        return objc_msgSend(*(id *)(a1 + 32), "cancelAssetRequest:");
      }
    }
  }
  return result;
}

- (id)requestAssetWithOptions:(id)a3 progressAndCancellationHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(JFXEffect *)self contentDataSource];
  char v12 = [v11 conformsToProtocol:&unk_26E82BD38];

  if (v12)
  {
    uint64_t v13 = [(JFXEffect *)self contentDataSource];
    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x3032000000;
    long long v24 = __Block_byref_object_copy__23;
    double v25 = __Block_byref_object_dispose__23;
    id v26 = 0;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __104__JFXEffect_AssetDownloading__requestAssetWithOptions_progressAndCancellationHandler_completionHandler___block_invoke;
    v18[3] = &unk_264C0CE98;
    id v19 = v9;
    double v20 = &v21;
    v18[4] = self;
    uint64_t v14 = [v13 requestAssetWithOptions:v8 progressHandler:v18 completionHandler:v10];
    uint64_t v15 = (void *)v22[5];
    v22[5] = v14;

    id v16 = (id)v22[5];
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    id v16 = 0;
  }

  return v16;
}

uint64_t __104__JFXEffect_AssetDownloading__requestAssetWithOptions_progressAndCancellationHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    char v3 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, char *))(result + 16))(result, &v3);
    if (v3)
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
        return objc_msgSend(*(id *)(a1 + 32), "cancelAssetRequest:");
      }
    }
  }
  return result;
}

- (id)requestAssetWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(JFXEffect *)self contentDataSource];
  char v12 = [v11 conformsToProtocol:&unk_26E82BD38];

  if (v12)
  {
    uint64_t v13 = [(JFXEffect *)self contentDataSource];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke;
    v18[3] = &unk_264C0CEC0;
    v18[4] = self;
    id v19 = v9;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60;
    v16[3] = &unk_264C0CEE8;
    v16[4] = self;
    id v17 = v10;
    uint64_t v14 = [v13 requestAssetWithOptions:v8 progressHandler:v18 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  id v4 = JFXLog_DebugEffectAssetDownloading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(a2);
  }
  return result;
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (a3)
  {
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_1();
    }
  }
  else if (v8)
  {
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_3();
    }
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_2();
    }
  }

LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)requestAllAssetsWithOptions:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(JFXEffect *)self contentDataSource];
  char v12 = [v11 conformsToProtocol:&unk_26E82BD38];

  if (v12)
  {
    uint64_t v13 = [(JFXEffect *)self contentDataSource];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke;
    v18[3] = &unk_264C0CEC0;
    v18[4] = self;
    id v19 = v9;
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62;
    v16[3] = &unk_264C0CF10;
    v16[4] = self;
    id v17 = v10;
    uint64_t v14 = [v13 requestAllAssetsWithOptions:v8 progressHandler:v18 completionHandler:v16];
  }
  else
  {
    (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke(uint64_t a1, double a2)
{
  id v4 = JFXLog_DebugEffectAssetDownloading();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(a1);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(a2);
  }
  return result;
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  if (a3)
  {
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_1();
    }
  }
  else if (v8)
  {
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_3();
    }
  }
  else
  {
    if (v7) {
      goto LABEL_8;
    }
    id v10 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_2();
    }
  }

LABEL_8:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelAssetRequest:(id)a3
{
  id v7 = a3;
  id v4 = [(JFXEffect *)self contentDataSource];
  int v5 = [v4 conformsToProtocol:&unk_26E82BD38];

  if (v5)
  {
    long long v6 = [(JFXEffect *)self contentDataSource];
    [v6 cancelAssetRequest:v7];
  }
}

- (void)updatePriorityForAssetRequest:(id)a3 newPriority:(int64_t)a4
{
  id v9 = a3;
  long long v6 = [(JFXEffect *)self contentDataSource];
  int v7 = [v6 conformsToProtocol:&unk_26E82BD38];

  if (v7)
  {
    id v8 = [(JFXEffect *)self contentDataSource];
    [v8 updatePriorityForAssetRequest:v9 newPriority:a4];
  }
}

- (id)availableAssetsWithFilteringOptionsArray:(id)a3
{
  id v4 = a3;
  int v5 = [(JFXEffect *)self contentDataSource];
  int v6 = [v5 conformsToProtocol:&unk_26E82BD38];

  if (v6)
  {
    int v7 = [(JFXEffect *)self contentDataSource];
    id v8 = [v7 availableAssetsWithFilteringOptionsArray:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)availableAssetsWithFilteringOptions:(id)a3
{
  id v4 = a3;
  int v5 = [(JFXEffect *)self contentDataSource];
  int v6 = [v5 conformsToProtocol:&unk_26E82BD38];

  if (v6)
  {
    int v7 = [(JFXEffect *)self contentDataSource];
    id v8 = [v7 availableAssetsWithFilteringOptions:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)localAssetsWithFilteringOptions:(id)a3
{
  id v4 = a3;
  int v5 = [(JFXEffect *)self contentDataSource];
  int v6 = [v5 conformsToProtocol:&unk_26E82BD38];

  if (v6)
  {
    int v7 = [(JFXEffect *)self contentDataSource];
    id v8 = [v7 localAssetsWithFilteringOptions:v4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA68];
  }

  return v8;
}

- (id)describeRequest:(id)a3
{
  id v4 = a3;
  int v5 = [(JFXEffect *)self contentDataSource];
  int v6 = [v5 conformsToProtocol:&unk_26E82BD38];

  if (v6)
  {
    int v7 = [(JFXEffect *)self contentDataSource];
    id v8 = [v7 describeRequest:v4];
  }
  else
  {
    id v8 = &stru_26E7CDB50;
  }

  return v8;
}

- (void)registerMotionDocumentWithinAssets:(id)a3
{
  id v4 = a3;
  int v5 = objc_opt_new();
  [v5 setContentType:5];
  int v6 = +[JFXEffectAsset firstAssetInAssets:v4 matchingFilterAttributes:v5];

  if (v6)
  {
    int v7 = [v6 localURL];
    id v8 = [v7 path];

    [(JFXEffect *)self setMotionDocumentFolderPath:v8];
    id v9 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[JFXEffect(AssetDownloading) registerMotionDocumentWithinAssets:]();
    }
  }
  else
  {
    id v8 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[JFXEffect(AssetDownloading) registerMotionDocumentWithinAssets:]();
    }
  }
}

- (BOOL)arePreviewingAssetsLocal
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(JFXEffect *)self isNone])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = [(JFXEffect *)self contentDataSource];
    if (!v4
      || (int v5 = (void *)v4,
          [(JFXEffect *)self contentDataSource],
          int v6 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v3) = [v6 isContentAvailable],
          v6,
          v5,
          v3))
    {
      int v7 = objc_opt_new();
      id v8 = objc_opt_new();
      [v8 setContentType:5];
      LOBYTE(v3) = 1;
      [v8 setUsageMode:1];
      id v9 = [(JFXEffect *)self availableAssetsWithFilteringOptions:v8];
      [v7 addObjectsFromArray:v9];

      id v10 = objc_opt_new();
      [v10 setContentType:1];
      [v10 setUsageMode:1];
      [v10 setAspectRatio:3];
      uint64_t v11 = [(JFXEffect *)self availableAssetsWithFilteringOptions:v10];
      [v7 addObjectsFromArray:v11];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v21;
LABEL_7:
        uint64_t v16 = 0;
        while (1)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v20 + 1) + 8 * v16);
          char v3 = objc_msgSend(v17, "localURL", (void)v20);
          if (!v3) {
            break;
          }
          char v18 = [v17 contentUpdateAvailable];

          if (v18)
          {
            LOBYTE(v3) = 0;
            break;
          }
          if (v14 == ++v16)
          {
            uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
            LOBYTE(v3) = 1;
            if (v14) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
  }
  return (char)v3;
}

- (id)requestPreviewingAssetsWithPriority:(int64_t)a3 onlyThumbnailAssetWhenAvailable:(BOOL)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  v28[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_opt_new();
  [v12 setContentType:1];
  [v12 setUsageMode:1];
  [v12 setFilteringMode:1];
  if (v7
    && ([(JFXEffect *)self availableAssetsWithFilteringOptions:v12],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 count],
        v13,
        v14))
  {
    uint64_t v15 = JFXLog_DebugEffectAssetDownloading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[JFXEffect(AssetDownloading) requestPreviewingAssetsWithPriority:onlyThumbnailAssetWhenAvailable:progressHandler:completionHandler:](self, v15);
    }

    uint64_t v16 = objc_opt_new();
    v28[0] = v12;
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];
    [v16 setFilterOptionsArray:v17];

    [v16 setPriority:a3];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke;
    v25[3] = &unk_264C0CF38;
    id v26 = v11;
    id v18 = v11;
    id v19 = [(JFXEffect *)self requestAssetWithOptions:v16 progressAndCancellationHandler:v10 completionHandler:v25];
    id v20 = v26;
  }
  else
  {
    uint64_t v16 = objc_opt_new();
    id v18 = (id)objc_opt_new();
    [v18 setContentType:5];
    [v18 setUsageMode:1];
    id v27 = v18;
    long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    [v16 setFilterOptionsArray:v21];

    [v16 setPriority:a3];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke_2;
    v23[3] = &unk_264C0CF10;
    v23[4] = self;
    id v24 = v11;
    id v20 = v11;
    id v19 = [(JFXEffect *)self requestAllAssetsWithOptions:v16 progressAndCancellationHandler:v10 completionHandler:v23];
  }
  return v19;
}

void __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    v12[0] = a2;
    BOOL v7 = (void *)MEMORY[0x263EFF8C0];
    id v8 = a4;
    id v9 = a2;
    id v10 = [v7 arrayWithObjects:v12 count:1];
    (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v10, a3, v8);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, void, uint64_t, id))(v6 + 16);
    id v9 = a4;
    id v10 = 0;
    v11(v6, 0, a3, v9);
  }
}

void __133__JFXEffect_AssetDownloading__requestPreviewingAssetsWithPriority_onlyThumbnailAssetWhenAvailable_progressHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v6 = a4;
  if (v7) {
    [*(id *)(a1 + 32) registerMotionDocumentWithinAssets:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)effectWillRenderPreviewWithOptions:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)areRenderingAssetsLocal
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([(JFXEffect *)self isNone])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = [(JFXEffect *)self contentDataSource];
    if (!v4
      || (int v5 = (void *)v4,
          [(JFXEffect *)self contentDataSource],
          id v6 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v3) = [v6 isContentAvailable],
          v6,
          v5,
          v3))
    {
      id v7 = objc_opt_new();
      [v7 setUsageMode:2];
      [(JFXEffect *)self availableAssetsWithFilteringOptions:v7];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
LABEL_7:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
          id v3 = objc_msgSend(v13, "localURL", (void)v16);
          if (!v3) {
            break;
          }
          char v14 = [v13 contentUpdateAvailable];

          if (v14)
          {
            LOBYTE(v3) = 0;
            break;
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
            LOBYTE(v3) = 1;
            if (v10) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (id)requestRenderingAssetsWithPriority:(int64_t)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  [v11 setUsageMode:2];
  uint64_t v12 = objc_opt_new();
  [v12 setContentType:5];
  [v12 setUsageMode:0];
  v19[0] = v11;
  v19[1] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
  [v10 setFilterOptionsArray:v13];

  [v10 setPriority:a3];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __100__JFXEffect_AssetDownloading__requestRenderingAssetsWithPriority_progressHandler_completionHandler___block_invoke;
  v17[3] = &unk_264C0CF10;
  v17[4] = self;
  id v18 = v8;
  id v14 = v8;
  uint64_t v15 = [(JFXEffect *)self requestAllAssetsWithOptions:v10 progressAndCancellationHandler:v9 completionHandler:v17];

  return v15;
}

void __100__JFXEffect_AssetDownloading__requestRenderingAssetsWithPriority_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v6 = a4;
  if (v7) {
    [*(id *)(a1 + 32) registerMotionDocumentWithinAssets:v7];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "error decoding JFXEffect parameters: %@", (uint8_t *)&v2, 0xCu);
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  int v2 = OUTLINED_FUNCTION_9(a1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_0() displayName];
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_4(&dword_234C41000, v4, v5, "downloading asset for %@ %@ progress %f", v6, v7, v8, v9, v10);
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = OUTLINED_FUNCTION_8(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_0() displayName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "downloading asset for %@ %@ was cancelled", v6, v7, v8, v9, v10);
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = OUTLINED_FUNCTION_8(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_0() displayName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "downloading asset for %@ %@ no asset found", v6, v7, v8, v9, v10);
}

void __89__JFXEffect_AssetDownloading__requestAssetWithOptions_progressHandler_completionHandler___block_invoke_60_cold_3()
{
  OUTLINED_FUNCTION_6_0();
  int v2 = OUTLINED_FUNCTION_9(v1);
  uint64_t v3 = NSStringFromJFXEffectType(v2);
  uint64_t v4 = [*(id *)(v0 + 32) displayName];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_4(&dword_234C41000, v5, v6, "downloading asset for %@ %@ had error %@", v7, v8, v9, v10, v11);
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_1()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = OUTLINED_FUNCTION_8(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_0() displayName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "downloading assets for %@ %@ was cancelled", v6, v7, v8, v9, v10);
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_2()
{
  OUTLINED_FUNCTION_7_0();
  int v2 = OUTLINED_FUNCTION_8(v1);
  NSStringFromJFXEffectType(v2);
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5_0() displayName];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_234C41000, v4, v5, "downloading assets for %@ %@ no assets found", v6, v7, v8, v9, v10);
}

void __93__JFXEffect_AssetDownloading__requestAllAssetsWithOptions_progressHandler_completionHandler___block_invoke_62_cold_3()
{
  OUTLINED_FUNCTION_6_0();
  int v2 = OUTLINED_FUNCTION_9(v1);
  uint64_t v3 = NSStringFromJFXEffectType(v2);
  uint64_t v4 = [*(id *)(v0 + 32) displayName];
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_3_4(&dword_234C41000, v5, v6, "downloading assets for %@ %@ had error %@", v7, v8, v9, v10, v11);
}

@end