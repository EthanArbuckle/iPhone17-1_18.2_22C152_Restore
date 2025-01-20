@interface JFXOverlayEffect
+ (BOOL)supportsSecureCoding;
+ (id)dynamicTextPlaceholderMap;
+ (id)effectIDToImageSequenceIDMap;
- (BOOL)JFX_hasPosterFrame;
- (BOOL)JFX_posterFrameIsCachable;
- (BOOL)JFX_shouldEnableDynamicLineSpacingForDiacritics;
- (BOOL)enablePresentationState:(BOOL)a3;
- (BOOL)hasBackground;
- (BOOL)hasDynamicText;
- (BOOL)hitTestPoint:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7 adjustForMinimumSize:(BOOL)a8 normalizedMinimumSize:(id)a9;
- (BOOL)includeDropShadowWhenPositioningCloseButton;
- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4;
- (BOOL)isCurrentlyTracking;
- (BOOL)isEditingFaceTrackingTransforms;
- (BOOL)isEmoji;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (BOOL)isInteractiveEditing;
- (BOOL)isTailFlipped;
- (BOOL)isTextFlipped;
- (BOOL)isTracked;
- (BOOL)loopedRangeRenderIsCacheable;
- (BOOL)objectBounds:(CGRect *)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (BOOL)prefersTrackingNotActivateAutomatically;
- (BOOL)supportsFlippingTail;
- (BOOL)supportsFlippingText;
- (BOOL)wasDynamicTextSet;
- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6;
- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 restrictToBounds:(int)a7;
- (CGPath)newPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8 outExpandedPath:(const CGPath *)a9;
- (CGPoint)closeButtonInset;
- (CGPoint)effectCenterAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8;
- (CGPoint)hitAreaScale;
- (CGPoint)screenPointToEffectPoint:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6;
- (CGRect)hitAreaBoundingFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7 relativeTo:(CGRect)a8 basisOrigin:(int)a9;
- (CGRect)imageFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7;
- (JFXFaceTrackedEffectTransform)internalFaceTrackingTransform;
- (JFXOverlayEffect)initWithCoder:(id)a3;
- (JFXOverlayEffect)initWithEffectID:(id)a3;
- (JFXTrackedEffectProperties)trackingProps;
- (NSString)accessibilityOverlayEffectLabel;
- (NSString)dynamicTextString;
- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 relativeTo:(CGPoint)a7 basisOrigin:(CGRect)a8;
- (double)JFX_adjustedMinimumSizeFromNormalizedMinimumSize:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7;
- (double)customPickerRotation;
- (double)effectPointToScreenPoint:effectToScreenTransform:viewSize:;
- (double)pickerScale;
- (double)transformAtTime:(uint64_t)a3@<X3> forcePosterFrame:(uint64_t)a4@<X4> includeTransformAnimation:(char)a5@<W5> includePlayableAspectScale:(uint64_t)a6@<X6> relativeTo:(long long *)a7@<X8> basisOrigin:(float64_t)a8@<D2>;
- (id)JFX_dynamicTextPlaceHolderText;
- (id)JFX_stringAtIndex:(unint64_t)a3;
- (id)accessibilityName;
- (id)contentProperties;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customPrimaryFillColor;
- (id)osfaToneMappingOption;
- (id)overlayContentDataSource;
- (id)serializableEffectParameters;
- (int)type;
- (int64_t)rotatedAspectRatio;
- (uint64_t)transformAtTime:(long long *)a3 forcePosterFrame:(uint64_t)a4 relativeTo:(uint64_t)a5 basisOrigin:;
- (unint64_t)dynamicTextType;
- (unint64_t)hash;
- (unint64_t)maxCharacters;
- (void)JFX_applyEffectParametersForFaceTrackingTransform:(id)a3;
- (void)JFX_setupTrackingProps;
- (void)JFX_updateInteractiveMode;
- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5;
- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5 restrictToBounds:(BOOL)a6;
- (void)beginEditingFaceTrackingTransforms;
- (void)beginInteractiveEditing;
- (void)encodeWithCoder:(id)a3;
- (void)endEditingFaceTrackingTransforms;
- (void)endInteractiveEditing;
- (void)renderEffectWillLoad;
- (void)resetDynamicTextString;
- (void)resumeTracking;
- (void)rotate:(double)a3 aroundPoint:(CGPoint)a4 withComponentTime:(id *)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7;
- (void)setAccessibilityOverlayEffectLabel:(id)a3;
- (void)setDynamicTextString:(id)a3;
- (void)setFaceTrackingTransform:(id)a3;
- (void)setFlipTail:(BOOL)a3;
- (void)setFlipText:(BOOL)a3;
- (void)setForceRenderAtPosterFrame:(BOOL)a3;
- (void)setImageSequencePath:(id)a3;
- (void)setImageSequencePathToBundledAssets;
- (void)setInternalFaceTrackingTransform:(id)a3;
- (void)setPosition:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 restrictToBounds:(BOOL)a7;
- (void)setPrefersTrackingNotActivateAutomatically:(BOOL)a3;
- (void)setSingleLineScaleThreshold:(double)a3;
- (void)setTrackingProps:(id)a3;
- (void)suspendTracking;
- (void)trackedEffectProperties:(id)a3 didChangeTrackingType:(BOOL)a4 didChangeEnabled:(BOOL)a5;
- (void)updateDynamicTextWithCompletionBlock:(id)a3;
- (void)updateRenderSizeMaintainingAppearance:(CGSize)a3 withComponentTime:(id *)a4;
- (void)updateRenderSizeMaintainingRelativeSizeAndPosition:(CGSize)a3 toSize:(CGSize)a4 withComponentTime:(id *)a5;
- (void)updateRenderSizeMaintainingSizeAndPositionRelativeToMedia:(CGSize)a3 mediaSize:(CGSize)a4 mediaContentMode:(int)a5;
@end

@implementation JFXOverlayEffect

- (JFXOverlayEffect)initWithEffectID:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffect;
  v3 = [(JFXEffect *)&v16 initWithEffectID:a3];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(JFXOverlayEffect *)v3 JFX_posterFrameIsCachable];
    v6 = [NSNumber numberWithBool:v5];
    [(JFXEffect *)v4 setParameter:v6 forKey:*MEMORY[0x263F616A0]];

    if ([(JFXOverlayEffect *)v4 JFX_shouldEnableDynamicLineSpacingForDiacritics])
    {
      [(JFXTextEffect *)v4 enableDynamicLineSpacingForDiacritics:1];
    }
    [(JFXTextEffect *)v4 setupLocalizedText];
    v7 = [MEMORY[0x263F086E0] jfxBundle];
    v8 = [v7 localizedStringForKey:@"Overlay Text Single Line Scale Threshold" value:&stru_26E7CDB50 table:0];

    [v8 doubleValue];
    -[JFXOverlayEffect setSingleLineScaleThreshold:](v4, "setSingleLineScaleThreshold:");
    uint64_t v9 = objc_opt_new();
    trackingProps = v4->_trackingProps;
    v4->_trackingProps = (JFXTrackedEffectProperties *)v9;

    [(JFXOverlayEffect *)v4 JFX_setupTrackingProps];
    [(JFXOverlayEffect *)v4 customPickerRotation];
    if (v11 != 0.0)
    {
      v12 = objc_msgSend(NSNumber, "numberWithDouble:");
      [(JFXEffect *)v4 setParameter:v12 forKey:@"PickerRotation"];
    }
    v13 = [(JFXOverlayEffect *)v4 customPrimaryFillColor];
    if (v13) {
      [(JFXEffect *)v4 setParameter:v13 forKey:@"PrimaryFillColor"];
    }
    v14 = [(JFXOverlayEffect *)v4 osfaToneMappingOption];
    if (v14) {
      [(JFXEffect *)v4 setParameter:v14 forKey:*MEMORY[0x263F61680]];
    }
    atomic_store(0, (unsigned int *)&v4->_isInteractiveEditingCount);
    atomic_store(0, (unsigned int *)&v4->_isEditingFaceTrackingTransformsCount);
  }
  return v4;
}

- (int)type
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)JFXOverlayEffect;
  id v4 = [(JFXTextEffect *)&v12 copyWithZone:a3];
  uint64_t v5 = [(JFXOverlayEffect *)self trackingProps];
  v6 = (void *)[v5 copy];
  [v4 setTrackingProps:v6];

  v7 = [(JFXOverlayEffect *)self faceTrackingTransform];
  v8 = (void *)[v7 copy];
  [v4 setFaceTrackingTransform:v8];

  uint64_t v9 = [(JFXOverlayEffect *)self accessibilityOverlayEffectLabel];
  v10 = (void *)[v9 copy];
  [v4 setAccessibilityOverlayEffectLabel:v10];

  objc_msgSend(v4, "setPrefersTrackingNotActivateAutomatically:", -[JFXOverlayEffect prefersTrackingNotActivateAutomatically](self, "prefersTrackingNotActivateAutomatically"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXOverlayEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXOverlayEffect;
  uint64_t v5 = [(JFXEffect *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJTAccessibilityOverlayEffectLabelKey"];
    accessibilityOverlayEffectLabel = v5->_accessibilityOverlayEffectLabel;
    v5->_accessibilityOverlayEffectLabel = (NSString *)v6;

    v5->_prefersTrackingNotActivateAutomatically = [v4 decodeBoolForKey:@"OverlayPrefersTrackingNotActivateAutomaticallyKey"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"JTOverlayEffectTrackingPropsKey"];
    trackingProps = v5->_trackingProps;
    v5->_trackingProps = (JFXTrackedEffectProperties *)v8;

    [(JFXOverlayEffect *)v5 JFX_setupTrackingProps];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffect;
  id v4 = a3;
  [(JFXEffect *)&v7 encodeWithCoder:v4];
  uint64_t v5 = [(JFXOverlayEffect *)self trackingProps];
  [v4 encodeObject:v5 forKey:@"JTOverlayEffectTrackingPropsKey"];

  uint64_t v6 = [(JFXOverlayEffect *)self accessibilityOverlayEffectLabel];
  [v4 encodeObject:v6 forKey:@"kJTAccessibilityOverlayEffectLabelKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[JFXOverlayEffect prefersTrackingNotActivateAutomatically](self, "prefersTrackingNotActivateAutomatically"), @"OverlayPrefersTrackingNotActivateAutomaticallyKey");
}

- (id)serializableEffectParameters
{
  v5.receiver = self;
  v5.super_class = (Class)JFXOverlayEffect;
  v2 = [(JFXEffect *)&v5 serializableEffectParameters];
  v3 = (void *)[v2 mutableCopy];

  [v3 removeObjectForKey:*MEMORY[0x263F617B8]];
  [v3 removeObjectForKey:*MEMORY[0x263F617A8]];
  [v3 removeObjectForKey:*MEMORY[0x263F61670]];
  [v3 removeObjectForKey:*MEMORY[0x263F61678]];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXOverlayEffect;
  if ([(JFXEffect *)&v10 isEqual:v4])
  {
    objc_super v5 = [v4 trackingProps];
    uint64_t v6 = [v5 currentTrackingType];
    objc_super v7 = [(JFXOverlayEffect *)self trackingProps];
    BOOL v8 = v6 == [v7 currentTrackingType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)JFXOverlayEffect;
  return [(JFXEffect *)&v3 hash];
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)JFXOverlayEffect;
  if ([(JFXTextEffect *)&v25 isAppearanceEqual:v6 forPurpose:a4])
  {
    id v7 = v6;
    BOOL v8 = [v7 trackingProps];
    uint64_t v9 = [v8 currentTrackingType];
    objc_super v10 = [(JFXOverlayEffect *)self trackingProps];
    uint64_t v11 = [v10 currentTrackingType];

    if (v9 != v11) {
      goto LABEL_10;
    }
    objc_super v12 = (void *)MEMORY[0x263F612E0];
    v13 = [(JFXEffect *)self topLevelTransformObject];
    v14 = [v7 topLevelTransformObject];
    LODWORD(v12) = [v12 isMatrix:v13 equivalentTo:v14];

    if (!v12) {
      goto LABEL_10;
    }
    v15 = [(JFXOverlayEffect *)self trackingProps];
    uint64_t v16 = [v15 currentTrackingType];
    v17 = [v7 trackingProps];
    uint64_t v18 = [v17 currentTrackingType];

    if (v16 != v18) {
      goto LABEL_10;
    }
    if (a4 == 1) {
      goto LABEL_8;
    }
    if (![(JFXOverlayEffect *)self isCurrentlyTracking]) {
      goto LABEL_8;
    }
    v19 = [(JFXOverlayEffect *)self faceTrackingTransform];
    v20 = [v7 faceTrackingTransform];
    v21 = [(JFXOverlayEffect *)self trackingProps];
    int v22 = objc_msgSend(v19, "isEqual:forTrackingType:", v20, objc_msgSend(v21, "currentTrackingType"));

    if (v22) {
LABEL_8:
    }
      BOOL v23 = 1;
    else {
LABEL_10:
    }
      BOOL v23 = 0;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)isEmoji
{
  objc_super v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    id v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    char v5 = [v4 isEmoji];
  }
  else
  {
    id v4 = [(JFXEffect *)self effectID];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F61420]];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)hasBackground
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = *MEMORY[0x263F010E0];
  long long v5 = v8;
  *(void *)&long long v9 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v3 = v9;
  [(JFXOverlayEffect *)self objectBounds:&v10 time:&v8 forcePosterFrame:1 includeDropShadow:1 includeMasks:1];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = v5;
  uint64_t v7 = v3;
  [(JFXTextEffect *)self textBounds:&v8 atIndex:0 time:&v6 forcePosterFrame:1 includeDropShadow:1 includeMasks:1];
  return *((double *)&v11 + 1) > *((double *)&v9 + 1);
}

- (void)renderEffectWillLoad
{
  v3.receiver = self;
  v3.super_class = (Class)JFXOverlayEffect;
  [(JFXEffect *)&v3 renderEffectWillLoad];
  [(JFXOverlayEffect *)self setImageSequencePathToBundledAssets];
}

- (id)overlayContentDataSource
{
  objc_super v3 = [(JFXEffect *)self contentDataSource];

  if (v3
    && ([(JFXEffect *)self contentDataSource],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 conformsToProtocol:&unk_26E8787E0],
        v4,
        v5))
  {
    long long v6 = [(JFXEffect *)self contentDataSource];
  }
  else
  {
    long long v6 = 0;
  }
  return v6;
}

- (id)contentProperties
{
  objc_super v3 = [(JFXOverlayEffect *)self overlayContentDataSource];
  if (v3)
  {
    v31.receiver = self;
    v31.super_class = (Class)JFXOverlayEffect;
    id v4 = [(JFXTextEffect *)&v31 contentProperties];
    int v5 = (void *)[v4 mutableCopy];

    long long v6 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:15];
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isLabel"));
    [v6 setObject:v7 forKeyedSubscript:@"isLabel"];

    long long v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "loopRenderRangeIsCachable"));
    [v6 setObject:v8 forKeyedSubscript:@"loopRenderRangeIsCachable"];

    long long v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "doesNotHavePosterFrame"));
    [v6 setObject:v9 forKeyedSubscript:@"doesNotHavePosterFrame"];

    long long v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "posterFrameIsNotCachable"));
    [v6 setObject:v10 forKeyedSubscript:@"posterFrameIsNotCachable"];

    long long v11 = [v3 initialRotation];

    if (v11)
    {
      objc_super v12 = [v3 initialRotation];
      [v6 setObject:v12 forKeyedSubscript:@"initialRotation"];
    }
    v13 = [v3 primaryFillColor];

    if (v13)
    {
      v14 = [v3 primaryFillColor];
      [v6 setObject:v14 forKeyedSubscript:@"primaryFillColor"];
    }
    v15 = [v3 hitAreaScale];

    if (v15)
    {
      uint64_t v16 = [v3 hitAreaScale];
      [v6 setObject:v16 forKeyedSubscript:@"hitAreaScale"];
    }
    v17 = [v3 pickerScale];

    if (v17)
    {
      uint64_t v18 = [v3 pickerScale];
      [v6 setObject:v18 forKeyedSubscript:@"pickerScale"];
    }
    v19 = [v3 fontSize];

    if (v19)
    {
      v20 = [v3 fontSize];
      [v6 setObject:v20 forKeyedSubscript:@"fontSize"];
    }
    v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "dynamicTextType"));
    [v6 setObject:v21 forKeyedSubscript:@"dynamicTextType"];

    int v22 = [v3 dynamicTextPlaceholder];

    if (v22)
    {
      BOOL v23 = [v3 dynamicTextPlaceholder];
      [v6 setObject:v23 forKeyedSubscript:@"dynamicTextPlaceholder"];
    }
    v24 = [v3 shouldDisableDynamicLineSpacingForDiatrics];

    if (v24)
    {
      objc_super v25 = [v3 shouldDisableDynamicLineSpacingForDiatrics];
      [v6 setObject:v25 forKeyedSubscript:@"shouldDisableDynamicLineSpacingForDiatrics"];
    }
    v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isEmoji"));
    [v6 setObject:v26 forKeyedSubscript:@"isEmoji"];

    v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "isTextBakedIn"));
    [v6 setObject:v27 forKeyedSubscript:@"isTextBakedIn"];

    v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "requireEmojiRenderingWorkaround"));
    [v6 setObject:v28 forKeyedSubscript:@"requireEmojiRenderingWorkaround"];

    if (v5)
    {
      [v5 addEntriesFromDictionary:v6];
      id v29 = v5;

      long long v6 = v29;
    }
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)JFXOverlayEffect;
    long long v6 = [(JFXTextEffect *)&v32 contentProperties];
  }

  return v6;
}

- (void)setSingleLineScaleThreshold:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F61730]];
}

- (void)setFlipText:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(JFXEffect *)self setParameter:v4 forKey:*MEMORY[0x263F616B8]];
}

- (BOOL)isTextFlipped
{
  objc_super v3 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616B8]];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    long long v6 = [(JFXEffect *)self renderEffect];
    char v5 = [v6 isTextFlipped];
  }
  return v5;
}

- (BOOL)supportsFlippingText
{
  v2 = [(JFXEffect *)self renderEffect];
  char v3 = [v2 supportsFlippingText];

  return v3;
}

- (void)setFlipTail:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = [NSNumber numberWithUnsignedInt:v4];
  [(JFXEffect *)self setParameter:v5 forKey:*MEMORY[0x263F616D8]];
}

- (BOOL)isTailFlipped
{
  char v3 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616D8]];
  uint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 intValue];
  }
  else
  {
    long long v6 = [(JFXEffect *)self renderEffect];
    int v5 = [v6 orientation];
  }
  return v5 == 2;
}

- (BOOL)supportsFlippingTail
{
  v2 = [(JFXEffect *)self renderEffect];
  char v3 = [v2 supportsOrientation];

  return v3;
}

- (BOOL)isHidden
{
  v5.receiver = self;
  v5.super_class = (Class)JFXOverlayEffect;
  if ([(JFXEffect *)&v5 isHidden]
    || [(JFXOverlayEffect *)self isCurrentlyTracking] && !self->_internalFaceTrackingTransform)
  {
    return 1;
  }
  [(JFXEffect *)self opacity];
  return v4 < 0.00001 && v4 > -0.00001;
}

- (double)customPickerRotation
{
  char v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    float v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    objc_super v5 = [v4 initialRotation];

    if (v5)
    {
      [v5 doubleValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 0.0;
    }
  }
  else
  {
    objc_super v5 = [(JFXTextEffect *)self editUIProperties];
    long long v8 = [(JFXEffect *)self effectID];
    long long v9 = [v5 objectForKeyedSubscript:v8];

    if (v9)
    {
      long long v10 = [v9 objectForKeyedSubscript:@"PickerRotation"];
      [v10 doubleValue];
      double v7 = v11 * 3.14159265 / 180.0;
    }
    else
    {
      double v7 = 0.0;
    }
  }
  return v7;
}

- (id)customPrimaryFillColor
{
  char v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    float v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    objc_super v5 = [v4 primaryFillColor];
  }
  else
  {
    float v4 = [(JFXTextEffect *)self editUIProperties];
    double v6 = [(JFXEffect *)self effectID];
    double v7 = [v4 objectForKeyedSubscript:v6];

    if (v7)
    {
      long long v8 = [v7 objectForKeyedSubscript:@"PrimaryFillColor"];
      long long v9 = v8;
      if (v8)
      {
        long long v10 = (void *)MEMORY[0x263F1C550];
        double v11 = [v8 objectAtIndexedSubscript:0];
        [v11 doubleValue];
        double v13 = v12;
        v14 = [v9 objectAtIndexedSubscript:1];
        [v14 doubleValue];
        double v16 = v15;
        v17 = [v9 objectAtIndexedSubscript:2];
        [v17 doubleValue];
        objc_super v5 = [v10 colorWithRed:v13 green:v16 blue:v18 alpha:1.0];
      }
      else
      {
        objc_super v5 = 0;
      }
    }
    else
    {
      objc_super v5 = 0;
    }
  }
  return v5;
}

- (id)osfaToneMappingOption
{
  char v3 = [(JFXTextEffect *)self editUIProperties];
  float v4 = [(JFXEffect *)self effectID];
  objc_super v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    double v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F61680]];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)setTrackingProps:(id)a3
{
  objc_storeStrong((id *)&self->_trackingProps, a3);
  [(JFXOverlayEffect *)self JFX_setupTrackingProps];
}

- (void)JFX_setupTrackingProps
{
  [(JFXTrackedEffectProperties *)self->_trackingProps setDelegate:self];
  [(JFXOverlayEffect *)self JFX_updateInteractiveMode];
}

- (BOOL)isTracked
{
  v2 = [(JFXOverlayEffect *)self trackingProps];
  BOOL v3 = [v2 trackingType] != 0;

  return v3;
}

- (BOOL)isCurrentlyTracking
{
  v2 = [(JFXOverlayEffect *)self trackingProps];
  BOOL v3 = [v2 currentTrackingType] != 0;

  return v3;
}

- (void)suspendTracking
{
  id v2 = [(JFXOverlayEffect *)self trackingProps];
  [v2 enableTrackingState:0];
}

- (void)resumeTracking
{
  id v2 = [(JFXOverlayEffect *)self trackingProps];
  [v2 enableTrackingState:1];
}

- (void)setFaceTrackingTransform:(id)a3
{
  id v6 = a3;
  id v4 = [(JFXOverlayEffect *)self internalFaceTrackingTransform];

  objc_super v5 = v6;
  if (v4 != v6)
  {
    [(JFXOverlayEffect *)self JFX_applyEffectParametersForFaceTrackingTransform:v6];
    objc_super v5 = v6;
  }
}

- (void)JFX_applyEffectParametersForFaceTrackingTransform:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(JFXOverlayEffect *)self setInternalFaceTrackingTransform:v4];
  BOOL v5 = [(JFXOverlayEffect *)self isCurrentlyTracking];
  if (v4 && v5)
  {
    id v6 = [(JFXOverlayEffect *)self trackingProps];
    double v7 = objc_msgSend(v4, "effectParametersForTrackingType:", objc_msgSend(v6, "currentTrackingType"));

    [(JFXEffect *)self addEffectParameters:v7];
  }
  else
  {
    uint64_t v8 = *MEMORY[0x263F61660];
    v11[0] = *MEMORY[0x263F61658];
    v11[1] = v8;
    uint64_t v9 = *MEMORY[0x263F61648];
    v11[2] = *MEMORY[0x263F617C0];
    v11[3] = v9;
    long long v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:4];
    [(JFXEffect *)self removeEffectParameters:v10];
  }
}

- (CGRect)imageFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  memset(&v11[1], 0, sizeof(PVCGPointQuad));
  v11[0].a = *(CGPoint *)&a3->var0;
  *(void *)&v11[0].b.x = a3->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v11, a4, a5, *(void *)&a7, 1.0, 1.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v11[0] = v11[1];
  pv_bounding_CGRect(v11);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)hitAreaBoundingFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7 relativeTo:(CGRect)a8 basisOrigin:(int)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a3;
  CGPathRef path = 0;
  double v9 = -[JFXOverlayEffect newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:](self, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v18, a4, *(void *)&a9, a6, &path, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height, a7.var0, a7.var1);
  PathBoundingBoCGFloat x = CGPathGetPathBoundingBox(path);
  CGFloat x = PathBoundingBox.origin.x;
  CGFloat y = PathBoundingBox.origin.y;
  CGFloat width = PathBoundingBox.size.width;
  CGFloat height = PathBoundingBox.size.height;
  CGPathRelease(v9);
  CGPathRelease(path);
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 relativeTo:(CGPoint)a7 basisOrigin:(CGRect)a8
{
  uint64_t v9 = *(void *)&a9;
  BOOL v10 = a6;
  BOOL v11 = a5;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a7.y;
  double x = a7.x;
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = [(JFXEffect *)self renderEffect];
  v19 = v18;
  if (v18)
  {
    long long v21 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    objc_msgSend(v18, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v21, v11, v10, v9, x, y, width, height);
  }
  else
  {
    retstr->c = 0u;
    retstr->d = 0u;
    retstr->a = 0u;
    retstr->b = 0u;
  }

  return result;
}

- (BOOL)objectBounds:(CGRect *)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  CGPoint v17 = (CGPoint)0;
  CGSize v18 = (CGSize)0;
  double v12 = [(JFXEffect *)self renderEffect];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a4;
  int v13 = [v12 bounds:&v17 atTime:&v16 forcePosterFrame:v9 includeDropShadow:v8 includeMasks:v7];

  if (v13)
  {
    CGSize v14 = v18;
    a3->origin = v17;
    a3->size = v14;
  }
  return v13;
}

- (uint64_t)transformAtTime:(long long *)a3 forcePosterFrame:(uint64_t)a4 relativeTo:(uint64_t)a5 basisOrigin:
{
  long long v6 = *a3;
  uint64_t v7 = *((void *)a3 + 2);
  return objc_msgSend(a1, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v6, a4, 1, 1, a5);
}

- (double)transformAtTime:(uint64_t)a3@<X3> forcePosterFrame:(uint64_t)a4@<X4> includeTransformAnimation:(char)a5@<W5> includePlayableAspectScale:(uint64_t)a6@<X6> relativeTo:(long long *)a7@<X8> basisOrigin:(float64_t)a8@<D2>
{
  a7[6] = 0u;
  a7[7] = 0u;
  a7[4] = 0u;
  a7[5] = 0u;
  a7[2] = 0u;
  a7[3] = 0u;
  *a7 = 0u;
  a7[1] = 0u;
  objc_super v32 = [a1 renderEffect];
  a18 = *a2;
  *(void *)&a19 = *((void *)a2 + 2);
  v33 = objc_msgSend(v32, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &a18, a3, a4, a6, a8, a9);
  v34 = v33;
  if (v33)
  {
    [v33 SIMDDouble4x4];
  }
  else
  {
    a7[6] = 0u;
    a7[7] = 0u;
    a7[4] = 0u;
    a7[5] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    *a7 = 0u;
    a7[1] = 0u;
  }

  if (a6 == 1)
  {
    uint64_t v36 = 0;
    v37.f64[0] = a8;
    v37.f64[1] = a9;
    __asm { FMOV            V2.2D, #0.5 }
    float64x2_t v43 = vmulq_f64(v37, _Q2);
    long long v44 = a7[5];
    a22 = a7[4];
    a23 = v44;
    long long v45 = a7[7];
    a24 = a7[6];
    a25 = v45;
    long long v46 = a7[1];
    a18 = *a7;
    a19 = v46;
    long long v47 = a7[3];
    a20 = a7[2];
    a21 = v47;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long vars0 = 0u;
    do
    {
      float64x2_t v49 = *(float64x2_t *)((char *)&a18 + v36);
      float64x2_t v48 = *(float64x2_t *)((char *)&a18 + v36 + 16);
      v50 = (float64x2_t *)((char *)&v68 + v36);
      float64x2_t *v50 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_234D61140, v49.f64[0]), (float64x2_t)xmmword_234D61130, v49, 1), (float64x2_t)0, v48.f64[0]), v43, v48, 1);
      v50[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v49.f64[0]), (float64x2_t)0, v49, 1), (float64x2_t)xmmword_234D61140, v48.f64[0]), (float64x2_t)xmmword_234D61130, v48, 1);
      v36 += 32;
    }
    while (v36 != 128);
    a7[4] = 0u;
    a7[5] = 0u;
    a7[6] = 0u;
    a7[7] = 0u;
    long long v51 = v69;
    *a7 = v68;
    a7[1] = v51;
    double result = *(double *)&v70;
    long long v52 = vars0;
    a7[2] = v70;
    a7[3] = v52;
  }
  if ((a5 & 1) == 0)
  {
    objc_msgSend(a1, "playableScaleInOutputSize:", a8, a9);
    double v54 = 1.0 / v53;
    double result = fabs(1.0 / v53 + -1.0);
    if (result >= 0.0001)
    {
      uint64_t v55 = 0;
      v56.f64[0] = 0.0;
      v56.f64[1] = v54;
      long long v57 = a7[5];
      a22 = a7[4];
      a23 = v57;
      long long v58 = a7[7];
      a24 = a7[6];
      a25 = v58;
      long long v59 = a7[1];
      a18 = *a7;
      a19 = v59;
      long long v60 = a7[3];
      a20 = a7[2];
      a21 = v60;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long vars0 = 0u;
      do
      {
        float64x2_t v62 = *(float64x2_t *)((char *)&a18 + v55);
        float64x2_t v61 = *(float64x2_t *)((char *)&a18 + v55 + 16);
        v63 = (float64x2_t *)((char *)&v68 + v55);
        float64x2_t *v63 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)*(unint64_t *)&v54, v62.f64[0]), v56, v62, 1), (float64x2_t)0, v61.f64[0]), (float64x2_t)0, v61, 1);
        v63[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v62.f64[0]), (float64x2_t)0, v62, 1), (float64x2_t)xmmword_234D61140, v61.f64[0]), (float64x2_t)xmmword_234D61130, v61, 1);
        v55 += 32;
      }
      while (v55 != 128);
      a7[4] = 0u;
      a7[5] = 0u;
      a7[6] = 0u;
      a7[7] = 0u;
      long long v64 = v69;
      *a7 = v68;
      a7[1] = v64;
      double result = *(double *)&v70;
      long long v65 = vars0;
      a7[2] = v70;
      a7[3] = v65;
    }
  }
  return result;
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6
{
  long long v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  return -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", v10, &v9, *(void *)&a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 restrictToBounds:(int)a7
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v39.a = *(CGPoint *)&a5->var0;
  *(void *)&v39.b.double x = a5->var3;
  [(JFXOverlayEffect *)self effectCenterAtTime:&v39 forcePosterFrame:1 includeTransformAnimation:1 includePlayableAspectScale:1 relativeTo:*(void *)&a7 basisOrigin:a6.origin.x];
  double v19 = v18;
  double v21 = v20;
  memset(&v39, 0, sizeof(v39));
  v38.a = *(CGPoint *)&a5->var0;
  *(void *)&v38.b.double x = a5->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v38, 1, 1, v9, 1.0, 1.0, x, y, width, height);
  PVCGPointQuad v38 = v39;
  pv_CGPoint_get_quad_center(&v38);
  double v23 = v22;
  double v25 = v24;
  v37.receiver = self;
  v37.super_class = (Class)JFXOverlayEffect;
  CGPoint v26 = *(CGPoint *)&a4->c;
  v35.a = *(CGPoint *)&a4->a;
  v35.b = v26;
  v35.c = *(CGPoint *)&a4->tx;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v36 = *a5;
  -[CGAffineTransform addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:](&v37, sel_addTransform_withComponentTime_relativeTo_basisOrigin_ignoreTranslation_, &v35, &v36, v9, 1, x, y, width, height);
  memset(&v38, 0, sizeof(v38));
  v35.a = *(CGPoint *)&a5->var0;
  *(void *)&v35.b.double x = a5->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v35, 1, 1, v9, 1.0, 1.0, x, y, width, height);
  PVCGPointQuad v35 = v38;
  pv_CGPoint_get_quad_center(&v35);
  double v28 = a4->tx + v23 - v27;
  double v30 = v25 - v29 + a4->ty;
  if (*MEMORY[0x263F001B0] != v28 || *(double *)(MEMORY[0x263F001B0] + 8) != v30 || v8)
  {
    v35.a = *(CGPoint *)&a5->var0;
    *(void *)&v35.b.double x = a5->var3;
    -[JFXOverlayEffect setPosition:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "setPosition:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v35, v9, v8, v19 + v28, v21 + v30, x, y, width, height);
  }
  double result = (CGAffineTransform *)[(JFXEffect *)self topLevelTransform];
  *(_OWORD *)&retstr->a = v32;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tdouble x = v34;
  return result;
}

- (int64_t)rotatedAspectRatio
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v3 userInterfaceIdiom])
  {

LABEL_7:
    return [(JFXEffect *)self playableAspectRatio];
  }
  id v4 = [MEMORY[0x263F1C5C0] currentDevice];
  unint64_t v5 = [v4 orientation] - 3;

  if (v5 > 1) {
    goto LABEL_7;
  }
  unint64_t v6 = [(JFXEffect *)self playableAspectRatio];
  return complementaryAspectRatio(v6);
}

- (void)updateRenderSizeMaintainingAppearance:(CGSize)a3 withComponentTime:(id *)a4
{
  double height = a3.height;
  double width = a3.width;
  [(JFXEffect *)self renderSize];
  double v9 = v8;
  double v11 = v10;
  double v12 = aspectRatioMultiplierForSize(v8, v10);
  double v13 = aspectRatioMultiplierForSize(width, height);
  if (vabdd_f64(v12, v13) >= 0.0001)
  {
    double v15 = fmin(v9, v11);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = [(JFXOverlayEffect *)self trackingProps];
    uint64_t v17 = [v16 trackingType];

    if ((unint64_t)(v17 - 1) >= 2)
    {
      if (!v17)
      {
        double v20 = 1.0;
        if (v12 * v15 >= v15) {
          double v21 = 1.0;
        }
        else {
          double v21 = v12;
        }
        double v22 = v15 / v21;
        double v23 = v12 * (v15 / v21);
        if (v13 * v15 < v15) {
          double v20 = v13;
        }
        double v24 = v15 / v20;
        double v25 = v13 * (v15 / v20);
        double v26 = CGRectMakeWithSize();
        long long v72 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        [(JFXOverlayEffect *)self imageFrameAtTime:&v72 forcePosterFrame:1 includeDropShadow:1 relativeTo:1 basisOrigin:v26];
        double v28 = v27;
        double v30 = v29;
        double v33 = CGRectGetCenterPoint(v31, v32, v27, v29) / v23;
        if (v23 > v22) {
          double v33 = v23 / v22 * v33 + (v23 / v22 + -1.0) * -0.5;
        }
        if (v25 > v24) {
          double v33 = ((v25 / v24 + -1.0) * 0.5 + v33) / (v25 / v24);
        }
        double v46 = CGRectMakeWithSizeAndCenterPoint(v28, v30, v25 * v33);
        double v48 = v47;
        double v50 = v49;
        double v52 = v51;
        -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
        [(JFXEffect *)self setPlayableAspectRatio:aspectRatioForSize(width, height)];
        double v53 = CGRectMakeWithSize();
        long long v72 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v72, v46, v48, v50, v52, v53, v54, v55, v56);
      }
    }
    else
    {
      if (fabs(v12 + -1.0 / v13) >= 0.0001)
      {
        +[JFXMediaSettings frameSize];
        double v36 = v35;
        if (fabs(v13 + -1.0) < 0.0001)
        {
          double v37 = v34;
          PVCGPointQuad v38 = [MEMORY[0x263F1C5C0] currentDevice];
          unint64_t v39 = [v38 orientation] - 3;

          double v34 = v37;
          if (v39 <= 1)
          {
            double v34 = CGSizeRotate90(v37, v36);
            double v36 = v40;
          }
        }
        double v41 = v15 * (v9 / v11);
        double v42 = width / height * v15;
        if (v41 <= v15)
        {
          BOOL v44 = v34 * (v15 / v36) < v41;
          double v43 = v41 / v34;
          if (!v44) {
            double v43 = v15 / v36;
          }
        }
        else
        {
          double v43 = v41 / v34;
          if (v36 * v43 < v15) {
            double v43 = v15 / v36;
          }
        }
        double v19 = v36 * v43;
        if (v42 <= v15)
        {
          double v45 = v15 / v36;
          if (v34 * (v15 / v36) < v42) {
            double v45 = v42 / v34;
          }
        }
        else
        {
          double v45 = v42 / v34;
          if (v36 * (v42 / v34) < v15) {
            double v45 = v15 / v36;
          }
        }
        double v18 = v36 * v45;
      }
      else
      {
        double v18 = v15 / v12;
        if (v15 / v12 > v15) {
          double v18 = v15;
        }
        double v19 = v15 / v13;
        if (v15 / v13 > v15) {
          double v19 = v15;
        }
      }
      [(JFXEffect *)self topLevelTransform];
      uint64_t v57 = 0;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      do
      {
        float64x2_t v59 = (float64x2_t)v63[v57 + 8];
        float64x2_t v58 = (float64x2_t)v63[v57 + 9];
        long long v60 = (float64x2_t *)((char *)&v64 + v57 * 16);
        *long long v60 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v62, v59.f64[0]), v61, v59, 1), (float64x2_t)0, v58.f64[0]), (float64x2_t)0, v58, 1);
        v60[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v59.f64[0]), (float64x2_t)0, v59, 1), (float64x2_t)xmmword_234D61140, v58.f64[0]), (float64x2_t)xmmword_234D61130, v58, 1);
        v57 += 2;
      }
      while (v57 != 8);
      v63[4] = v68;
      v63[5] = v69;
      v63[6] = v70;
      v63[7] = v71;
      v63[0] = v64;
      v63[1] = v65;
      v63[2] = v66;
      v63[3] = v67;
      [(JFXEffect *)self setTopLevelTransform:v63];
      -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
      [(JFXEffect *)self setPlayableAspectRatio:aspectRatioForSize(width, height)];
    }
  }
  else
  {
    -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
    unint64_t v14 = aspectRatioForSize(width, height);
    [(JFXEffect *)self setPlayableAspectRatio:v14];
  }
}

- (void)updateRenderSizeMaintainingRelativeSizeAndPosition:(CGSize)a3 toSize:(CGSize)a4 withComponentTime:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  double v11 = aspectRatioMultiplierForSize(a3.width, a3.height);
  if (vabdd_f64(v11, aspectRatioMultiplierForSize(width, height)) >= 0.0001)
  {
    double v13 = [(JFXOverlayEffect *)self trackingProps];
    uint64_t v14 = [v13 trackingType];

    if ((unint64_t)(v14 - 1) >= 2)
    {
      if (!v14)
      {
        double v36 = CGRectMakeWithSize();
        double v16 = v15;
        *(_OWORD *)&v40.a = *(_OWORD *)&a5->var0;
        *(void *)&v40.c = a5->var3;
        CGFloat v18 = v17;
        double v34 = v19;
        double v35 = v17;
        CGFloat v20 = v19;
        [(JFXOverlayEffect *)self imageFrameAtTime:&v40 forcePosterFrame:1 includeDropShadow:1 relativeTo:1 basisOrigin:v36];
        CGFloat v31 = v22;
        CGFloat v32 = v21;
        CGFloat v29 = v24;
        CGFloat v30 = v23;
        v42.origin.double x = v36;
        v42.origin.double y = v16;
        v42.size.double width = v18;
        v42.size.double height = v20;
        double MidX = CGRectGetMidX(v42);
        v43.origin.double x = v36;
        v43.origin.double y = v16;
        v43.size.double width = v18;
        v43.size.double height = v20;
        double MidY = CGRectGetMidY(v43);
        double v28 = height / v8;
        v44.origin.double x = v32;
        v44.origin.double y = v31;
        v44.size.double width = v30;
        v44.size.double height = v29;
        double v26 = CGRectGetMidX(v44);
        v45.origin.double x = v32;
        v45.origin.double y = v31;
        v45.size.double width = v30;
        v45.size.double height = v29;
        CGFloat v27 = CGRectGetMidY(v45);
        memset(&v40, 0, sizeof(v40));
        CGAffineTransformMakeTranslation(&v40, MidX + (v26 - MidX) * (width / v9) - v26, MidY + (v27 - MidY) * v28 - v27);
        CGAffineTransform v39 = v40;
        long long v37 = *MEMORY[0x263F010E0];
        uint64_t v38 = *(void *)(MEMORY[0x263F010E0] + 16);
        -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v39, &v37, 1, v36, v16, v35, v34);
        -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
        [(JFXEffect *)self setPlayableAspectRatio:aspectRatioForSize(width, height)];
      }
    }
    else
    {
      *(_OWORD *)&v40.a = *(_OWORD *)&a5->var0;
      *(void *)&v40.c = a5->var3;
      -[JFXOverlayEffect updateRenderSizeMaintainingAppearance:withComponentTime:](self, "updateRenderSizeMaintainingAppearance:withComponentTime:", &v40, width, height);
    }
  }
  else
  {
    -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
    unint64_t v12 = aspectRatioForSize(width, height);
    [(JFXEffect *)self setPlayableAspectRatio:v12];
  }
}

- (void)updateRenderSizeMaintainingSizeAndPositionRelativeToMedia:(CGSize)a3 mediaSize:(CGSize)a4 mediaContentMode:(int)a5
{
  double height = a4.height;
  double width = a4.width;
  double v8 = a3.height;
  double v9 = a3.width;
  [(JFXEffect *)self renderSize];
  double v12 = v11;
  double v14 = v13;
  double v15 = aspectRatioMultiplierForSize(v11, v13);
  double v16 = aspectRatioMultiplierForSize(v9, v8);
  if (vabdd_f64(v15, v16) >= 0.0001)
  {
    double v18 = width / height;
    double v19 = [(JFXEffect *)self transformAnimation];
    [(JFXEffect *)self setTransformAnimation:0];
    double v20 = fmin(v12, v14);
    double v21 = 1.0;
    if (v15 * v20 >= v20) {
      double v22 = 1.0;
    }
    else {
      double v22 = v15;
    }
    double v23 = v20 / v22;
    double v24 = v15 * (v20 / v22);
    if (v16 * v20 < v20) {
      double v21 = v16;
    }
    double v25 = v20 / v21;
    double v26 = v16 * (v20 / v21);
    CGFloat v27 = [(JFXOverlayEffect *)self trackingProps];
    uint64_t v28 = [v27 currentTrackingType];

    if ((unint64_t)(v28 - 1) < 2)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      [(JFXEffect *)self topLevelTransform];
      pv_simd_matrix_scale();
      long long v67 = v59;
      long long v68 = v60;
      long long v69 = v61;
      long long v70 = v62;
      long long v63 = v55;
      long long v64 = v56;
      long long v65 = v57;
      long long v66 = v58;
      v53[4] = v59;
      long long vars0 = v60;
      v53[2] = v57;
      v53[3] = v58;
      v53[0] = v55;
      v53[1] = v56;
      [(JFXEffect *)self setTopLevelTransform:v53];
LABEL_61:
      [(JFXEffect *)self setTransformAnimation:v19];

      return;
    }
    if (v28) {
      goto LABEL_61;
    }
    double v52 = v18;
    double v29 = CGRectMakeWithSize();
    long long v51 = *MEMORY[0x263F010E0];
    long long v63 = *MEMORY[0x263F010E0];
    uint64_t v30 = *(void *)(MEMORY[0x263F010E0] + 16);
    *(void *)&long long v64 = v30;
    [(JFXOverlayEffect *)self imageFrameAtTime:&v63 forcePosterFrame:1 includeDropShadow:1 relativeTo:1 basisOrigin:v29];
    double v35 = v24;
    double v36 = v23;
    if (a5)
    {
      if (a5 <= 2)
      {
        if (a5 == 1)
        {
          double v37 = v52;
          if (v24 <= v23)
          {
            double v36 = v23;
            if (v52 * v23 < v24) {
              double v36 = v24 / v52;
            }
          }
          else
          {
            double v36 = v24 / v52;
            if (v24 / v52 < v23) {
              double v36 = v23;
            }
          }
        }
        else
        {
          double v35 = v52;
          double v36 = 1.0;
          if (a5 != 2) {
            goto LABEL_35;
          }
          double v37 = v52;
          if (v24 / v52 <= v23) {
            double v36 = v24 / v52;
          }
          else {
            double v36 = v23;
          }
        }
        double v35 = v37 * v36;
      }
      else
      {
        double v35 = v24;
        double v36 = v23;
        if (a5 != 3)
        {
          if (a5 == 13)
          {
            double v35 = v24;
            double v36 = v24 / v52;
          }
          else
          {
            if (a5 == 14) {
              double v35 = v52 * v23;
            }
            else {
              double v35 = v52;
            }
            if (a5 == 14) {
              double v36 = v23;
            }
            else {
              double v36 = 1.0;
            }
          }
        }
      }
    }
LABEL_35:
    CGRect v71 = CGRectOffset(*(CGRect *)&v31, -((v24 - v35) * 0.5 + 0.0), -((v23 - v36) * 0.5 + 0.0));
    double v38 = v26;
    double v39 = v25;
    if (a5)
    {
      double v39 = 1.0;
      if (a5 > 2)
      {
        double v40 = v26 / v52;
        double v41 = v52 * v25;
        if (a5 == 14) {
          double v39 = v25;
        }
        else {
          double v41 = v52;
        }
        if (a5 == 13) {
          double v41 = v26;
        }
        else {
          double v40 = v39;
        }
        if (a5 == 3) {
          double v38 = v26;
        }
        else {
          double v38 = v41;
        }
        if (a5 == 3) {
          double v39 = v25;
        }
        else {
          double v39 = v40;
        }
        goto LABEL_60;
      }
      if (a5 == 1)
      {
        if (v26 <= v25)
        {
          double v42 = v52;
          double v39 = v25;
          if (v52 * v25 < v26) {
            double v39 = v26 / v52;
          }
        }
        else
        {
          double v42 = v52;
          double v39 = v26 / v52;
          if (v26 / v52 < v25) {
            double v39 = v25;
          }
        }
      }
      else
      {
        if (a5 != 2)
        {
          double v38 = v52;
          goto LABEL_60;
        }
        double v42 = v52;
        if (v26 / v52 <= v25) {
          double v39 = v26 / v52;
        }
        else {
          double v39 = v25;
        }
      }
      double v38 = v42 * v39;
    }
LABEL_60:
    v72.origin.double x = v71.origin.x / v35 * v38;
    v72.origin.double y = v71.origin.y / v36 * v39;
    v72.size.double width = v71.size.width / v35 * v38;
    v72.size.double height = v71.size.height / v36 * v39;
    CGRect v73 = CGRectOffset(v72, (v26 - v38) * 0.5 + 0.0, (v25 - v39) * 0.5 + 0.0);
    double x = v73.origin.x;
    double y = v73.origin.y;
    double v45 = v73.size.width;
    double v46 = v73.size.height;
    -[JFXEffect setRenderSize:](self, "setRenderSize:", v9, v8);
    [(JFXEffect *)self setPlayableAspectRatio:aspectRatioForSize(v9, v8)];
    double v47 = CGRectMakeWithSize();
    long long v63 = v51;
    *(void *)&long long v64 = v30;
    -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v63, x, y, v45, v46, v47, v48, v49, v50);
    goto LABEL_61;
  }
  -[JFXEffect setRenderSize:](self, "setRenderSize:", v9, v8);
  unint64_t v17 = aspectRatioForSize(v9, v8);
  [(JFXEffect *)self setPlayableAspectRatio:v17];
}

- (void)rotate:(double)a3 aroundPoint:(CGPoint)a4 withComponentTime:(id *)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v13 = a4.y;
  double v14 = a4.x;
  unint64_t v17 = [(JFXOverlayEffect *)self trackingProps];
  uint64_t v18 = [v17 trackingType];

  if (!v18)
  {
    *(_OWORD *)&v32.a = *(_OWORD *)&a5->var0;
    *(void *)&v32.c = a5->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v32, 1, 1, v7, x, y, width, height);
    double CenterPoint = CGRectGetCenterPoint(v19, v20, v21, v22);
    double v26 = height;
    double v25 = v24;
    CGAffineTransformMakeRotation(&v28, a3);
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeTranslation(&t1, -v14, -v13);
    CGAffineTransform t2 = v28;
    CGAffineTransformConcat(&v32, &t1, &t2);
    CGAffineTransformMakeTranslation(&t2, v14, v13);
    CGAffineTransformConcat(&v29, &v32, &t2);
    CGAffineTransformMakeTranslation(&v27, v29.tx + v25 * v29.c + v29.a * CenterPoint - CenterPoint, v29.ty + v25 * v29.d + v29.b * CenterPoint - v25);
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->var0;
    *(void *)&t1.c = a5->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v27, &t1, v7, x, y, width, v26);
  }
}

- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5 restrictToBounds:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v12 = a3.size.height;
  CGFloat v47 = a3.origin.x;
  double v48 = a3.size.width;
  CGFloat v13 = a3.origin.y;
  *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
  *(void *)&v52.c = a4->var3;
  -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 1, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  CGFloat v15 = v59.size.width;
  CGFloat v16 = v59.size.height;
  if (!CGRectIsEmpty(v59))
  {
    CGFloat v44 = v13;
    double v45 = v12;
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(void *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 0, 1, x, y, width, height);
    double v17 = v15;
    double v19 = v18;
    double v46 = v16;
    double v21 = v20;
    memset(&v58, 0, sizeof(v58));
    CGAffineTransformMakeScale(&v58, 2.0, 2.0);
    v51.a = *(CGPoint *)&v58.a;
    v51.b = *(CGPoint *)&v58.c;
    v51.c = *(CGPoint *)&v58.tx;
    *(_OWORD *)&v56.a = *(_OWORD *)&a4->var0;
    *(void *)&v56.c = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v51, &v56, 1, x, y, width, height);
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(void *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 1, 1, x, y, width, height);
    double v23 = v22;
    double v40 = v24;
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(void *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 0, 1, x, y, width, height);
    double v42 = v21;
    double v43 = v19;
    double v26 = vabdd_f64(v46, v21);
    double v41 = vabdd_f64(v17, v19);
    if (vabdd_f64(vabdd_f64(v23, v27) * 0.5, v41) <= 1.0)
    {
      double v28 = v17;
      double v29 = vabdd_f64(vabdd_f64(v40, v25) * 0.5, v26);
      CGAffineTransform v52 = v58;
      CGAffineTransformInvert(&v57, &v52);
      v51.a = *(CGPoint *)&a4->var0;
      *(void *)&v51.b.double x = a4->var3;
      -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v57, &v51, 1, x, y, width, height);
      if (v29 <= 1.0)
      {
        double v32 = v48;
        CGFloat v33 = v45;
        double v31 = v46;
        double v34 = v45;
        double v35 = v28;
        CGFloat v30 = v48;
        goto LABEL_7;
      }
    }
    else
    {
      CGAffineTransform v52 = v58;
      CGAffineTransformInvert(&v57, &v52);
      v51.a = *(CGPoint *)&a4->var0;
      *(void *)&v51.b.double x = a4->var3;
      -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v57, &v51, 1, x, y, width, height);
    }
    CGFloat v30 = v48;
    double v31 = v42;
    double v32 = v48 - v41;
    CGFloat v33 = v45;
    double v34 = v45 - v26;
    double v35 = v43;
LABEL_7:
    double v36 = CGSizeFitToAspectInSize(v32, v34, v35, v31);
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformMakeScale(&v56, v36 / v35, v36 / v35);
    v51.a = *(CGPoint *)&v56.a;
    v51.b = *(CGPoint *)&v56.c;
    v51.c = *(CGPoint *)&v56.tx;
    long long v54 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v51, &v54, 1, x, y, width, height);
    v60.origin.double x = v47;
    v60.origin.double y = v44;
    v60.size.double width = v30;
    v60.size.double height = v33;
    double MidX = CGRectGetMidX(v60);
    v61.origin.double x = v47;
    v61.origin.double y = v44;
    v61.size.double width = v30;
    v61.size.double height = v33;
    double MidY = CGRectGetMidY(v61);
    CGPoint v53 = (CGPoint)0;
    memset(&v52, 0, sizeof(v52));
    v51.a = *(CGPoint *)&a4->var0;
    *(void *)&v51.b.double x = a4->var3;
    -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v51, 1, 1, 1, 1.0, 1.0, x, y, width, height);
    v51.a = *(CGPoint *)&v52.a;
    v51.b = *(CGPoint *)&v52.c;
    v51.c = *(CGPoint *)&v52.tx;
    v51.d = v53;
    pv_CGPoint_get_quad_center(&v51);
    CGAffineTransformMakeTranslation(&v50, MidX - v38, MidY - v39);
    long long v54 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v50, &v54, 1, v6, x, y, width, height);
  }
}

- (void)setPosition:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  uint64_t v7 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v13 = a3.y;
  v14.f64[0] = a3.x;
  if (a7)
  {
    float64_t v45 = v13;
    CGFloat v48 = a3.x;
    -[JFXEffect playableRectInOutputSize:](self, "playableRectInOutputSize:", a5.size.width, a5.size.height);
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    long long v53 = *(_OWORD *)&a4->var0;
    *(void *)&long long v54 = a4->var3;
    -[JFXOverlayEffect effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:](self, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v53, 1, 1, 1, v7, x, y, width, height);
    float64_t v42 = v25;
    float64_t v43 = v24;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v61 = *(_OWORD *)&a4->var0;
    *(void *)&long long v62 = a4->var3;
    -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v61, 1, 1, v7, 1.0, 1.0, x, y, width, height);
    long long v61 = v53;
    long long v62 = v54;
    long long v63 = v55;
    long long v64 = v56;
    pv_CGPoint_get_quad_center((PVCGPointQuad *)&v61);
    v27.f64[1] = v26;
    v28.f64[0] = v43;
    v28.f64[1] = v42;
    float64x2_t v29 = vsubq_f64(v27, v28);
    v27.f64[0] = v48;
    v27.f64[1] = v45;
    float64x2_t v44 = v29;
    float64x2_t v46 = vaddq_f64(v27, v29);
    v27.f64[0] = v17;
    v28.f64[0] = v19;
    v29.f64[0] = v21;
    CGFloat v30 = v23;
    CGFloat MinX = CGRectGetMinX(*(CGRect *)v27.f64);
    v65.origin.double x = v17;
    v65.origin.double y = v19;
    v65.size.double width = v21;
    v65.size.double height = v23;
    CGFloat MinY = CGRectGetMinY(v65);
    v32.f64[0] = MinX;
    v32.f64[1] = MinY;
    float64x2_t v50 = v32;
    CGFloat v33 = v17;
    v32.f64[0] = v19;
    CGFloat v34 = v21;
    CGFloat v35 = v23;
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)((char *)&v32 - 8));
    v66.origin.double x = v17;
    v66.origin.double y = v19;
    v66.size.double width = v21;
    v66.size.double height = v23;
    CGFloat MaxY = CGRectGetMaxY(v66);
    v37.f64[0] = MaxX;
    v37.f64[1] = MaxY;
    float64x2_t v14 = vsubq_f64(vminnmq_f64(vmaxnmq_f64(v46, v50), v37), v44);
    double v13 = v14.f64[1];
  }
  long long v53 = *(_OWORD *)&a4->var0;
  *(void *)&long long v54 = a4->var3;
  -[JFXOverlayEffect screenPointToEffectPoint:withComponentTime:relativeTo:basisOrigin:](self, "screenPointToEffectPoint:withComponentTime:relativeTo:basisOrigin:", &v53, v7, v14.f64[0], v13, x, y, width, height, *(void *)&MaxX);
  uint64_t v47 = v39;
  uint64_t v51 = v38;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  [(JFXEffect *)self topLevelTransform];
  *(void *)&long long v40 = v51;
  *((void *)&v40 + 1) = v47;
  long long v59 = v40;
  var20[0] = v53;
  var20[1] = v54;
  var20[2] = v55;
  [(JFXEffect *)self setTopLevelTransform:var20];
}

- (double)effectPointToScreenPoint:effectToScreenTransform:viewSize:
{
  pv_simd_matrix_transform_vector();
  return v1;
}

- (CGPoint)screenPointToEffectPoint:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a3.y;
  double x = a3.x;
  -[JFXEffect playableScaleInOutputSize:](self, "playableScaleInOutputSize:", a5.size.width, a5.size.height, a5.origin.x, a5.origin.y);
  if (fabs(v13 + -1.0) >= 0.0001)
  {
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeScale(&v67, 1.0 / v13, 1.0 / v13);
    memset(&v66, 0, sizeof(v66));
    CGAffineTransformMakeTranslation((CGAffineTransform *)&t1, -(width * 0.5), -(height * 0.5));
    CGAffineTransform t2 = v67;
    CGAffineTransformConcat(&v64, (CGAffineTransform *)&t1, &t2);
    CGAffineTransformMakeTranslation(&t2, width * 0.5, height * 0.5);
    CGAffineTransformConcat(&v66, &v64, &t2);
    CGAffineTransform v67 = v66;
    double v14 = y * v66.d + v66.b * x;
    double x = v66.tx + y * v66.c + v66.a * x;
    double y = v66.ty + v14;
  }
  double v65 = 0.0;
  memset(&v64, 0, sizeof(v64));
  CGFloat v15 = (void *)MEMORY[0x263F61300];
  double v16 = [(JFXEffect *)self transformAnimation];
  *(_OWORD *)&t1.time.int64_t value = *(_OWORD *)&a4->var0;
  t1.time.epoch = a4->var3;
  int v17 = objc_msgSend(v15, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v16, &t1, 14, 0, &v64, width, height);

  if (v17)
  {
    memset(&t2, 0, sizeof(t2));
    v69.double x = width * 0.5;
    v69.double y = height * 0.5;
    *(_OWORD *)&t1.time.int64_t value = *(_OWORD *)&v64.a;
    *(_OWORD *)&t1.time.epoch = *(_OWORD *)&v64.c;
    *(_OWORD *)&t1.translation.double y = *(_OWORD *)&v64.tx;
    t1.rotation = v65;
    CGAffineTransformFromPointWithPVAnimInfo((uint64_t *)&t2, &t1, v69);
    *(_OWORD *)&t1.time.int64_t value = *(_OWORD *)&t2.a;
    *(_OWORD *)&t1.time.epoch = *(_OWORD *)&t2.c;
    *(_OWORD *)&t1.translation.double y = *(_OWORD *)&t2.tx;
    CGAffineTransformInvert(&v62, (CGAffineTransform *)&t1);
    double v18 = y * v62.d + v62.b * x;
    double x = v62.tx + y * v62.c + v62.a * x;
    double y = v62.ty + v18;
  }
  CGFloat v19 = [(JFXEffect *)self renderEffect];
  [v19 outputSize];
  double v21 = v20;
  double v23 = v22;

  double v24 = [(JFXEffect *)self renderEffect];
  int v25 = [v24 origin];

  double v57 = *(double *)(MEMORY[0x263F00148] + 8);
  tdouble x = *MEMORY[0x263F00148];
  if (a6 == 2)
  {
    if (v25) {
      double v38 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    else {
      double v38 = height * 0.5;
    }
    if (v25) {
      double v39 = *MEMORY[0x263F00148];
    }
    else {
      double v39 = width * 0.5;
    }
    BOOL v35 = v25 == 1;
    if (v25 == 1) {
      double v36 = height * 0.5;
    }
    else {
      double v36 = v38;
    }
    if (v25 == 1) {
      double v37 = width * 0.5;
    }
    else {
      double v37 = v39;
    }
  }
  else
  {
    double v26 = width * -0.5;
    double v27 = height * 0.5;
    if (v25) {
      double v28 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    else {
      double v28 = height;
    }
    BOOL v29 = v25 == 2 || v25 == 0;
    if (v25 == 2)
    {
      double v30 = width * -0.5;
    }
    else
    {
      double v27 = v28;
      double v30 = *MEMORY[0x263F00148];
    }
    double v31 = height * -0.5;
    BOOL v32 = v25 == 1;
    if (v25 == 1) {
      double v33 = height;
    }
    else {
      double v33 = *(double *)(MEMORY[0x263F00148] + 8);
    }
    if (v25 == 2)
    {
      BOOL v32 = 0;
    }
    else
    {
      double v31 = v33;
      double v26 = *MEMORY[0x263F00148];
    }
    if (a6)
    {
      BOOL v32 = 0;
      double v31 = *(double *)(MEMORY[0x263F00148] + 8);
      double v26 = *MEMORY[0x263F00148];
    }
    BOOL v34 = a6 == 1;
    if (a6 == 1) {
      BOOL v35 = v29;
    }
    else {
      BOOL v35 = v32;
    }
    if (v34) {
      double v36 = v27;
    }
    else {
      double v36 = v31;
    }
    if (v34) {
      double v37 = v30;
    }
    else {
      double v37 = v26;
    }
  }
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeScale(&v67, v21 / width, v23 / height);
  CGAffineTransform t2 = v67;
  CGAffineTransformTranslate((CGAffineTransform *)&t1, &t2, v37, v36);
  *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
  *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
  *(_OWORD *)&v67.tdouble x = *(_OWORD *)&t1.translation.y;
  if (v35)
  {
    CGAffineTransform t2 = v67;
    CGAffineTransformScale((CGAffineTransform *)&t1, &t2, 1.0, -1.0);
    *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
    *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
    *(_OWORD *)&v67.tdouble x = *(_OWORD *)&t1.translation.y;
  }
  double v60 = v67.tx + y * v67.c + v67.a * x;
  double v59 = v67.ty + y * v67.d + v67.b * x;
  long long v40 = [(JFXEffect *)self effectParameters];
  double v41 = [v40 objectForKeyedSubscript:*MEMORY[0x263F61648]];
  int v42 = [v41 BOOLValue];

  float64_t v43 = [(JFXEffect *)self effectParameters];
  float64x2_t v44 = [v43 objectForKeyedSubscript:*MEMORY[0x263F617C0]];

  float64_t v45 = [(JFXEffect *)self effectParameters];
  float64x2_t v46 = [v45 objectForKeyedSubscript:*MEMORY[0x263F61660]];

  uint64_t v47 = [(JFXEffect *)self effectParameters];
  CGFloat v48 = [v47 objectForKeyedSubscript:*MEMORY[0x263F61658]];

  if (v42 && v44 && v46 && v48)
  {
    double v49 = [(JFXEffect *)self renderEffect];
    [v49 outputROI];

    if (v25 == 2)
    {
      tdouble x = v21 * 0.5;
      double v51 = v23 * 0.5;
      int v50 = 1;
    }
    else if (v25)
    {
      int v50 = 0;
      double v51 = v57;
    }
    else
    {
      int v50 = 1;
      double v51 = v23;
    }
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeScale(&v67, v21 / v21, v23 / v23);
    CGAffineTransform t2 = v67;
    CGAffineTransformTranslate((CGAffineTransform *)&t1, &t2, tx, v51);
    *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
    *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
    *(_OWORD *)&v67.tdouble x = *(_OWORD *)&t1.translation.y;
    if (v50)
    {
      CGAffineTransform t2 = v67;
      CGAffineTransformScale((CGAffineTransform *)&t1, &t2, 1.0, -1.0);
      *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
      *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
      *(_OWORD *)&v67.tdouble x = *(_OWORD *)&t1.translation.y;
    }
    float64x2_t v61 = vaddq_f64(*(float64x2_t *)&v67.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v67.c, v59), *(float64x2_t *)&v67.a, v60));
    memset(&t1, 0, 24);
    [v44 SIMDDouble4x4];
    [v46 SIMDDouble4x4];
    [v48 SIMDDouble4x4];
    int v52 = pv_simd_matrix_unproject_to_plane();
    int64_t value = t1.time.value;
    double v54 = *(double *)&t1.time.timescale;
    if (!v52)
    {
      double v54 = v61.f64[1];
      int64_t value = *(int64_t *)&v61.f64[0];
    }
    double v59 = v54;
    double v60 = *(double *)&value;
  }

  double v56 = v59;
  double v55 = v60;
  result.double y = v56;
  result.double x = v55;
  return result;
}

- (CGPoint)effectCenterAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v15 = *(_OWORD *)&a3->var0;
  *(void *)&long long v16 = a3->var3;
  -[JFXOverlayEffect transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:](self, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v15, a4, a5, a6, *(void *)&a8, a7.origin.x, a7.origin.y, a7.size.width);
  double v11 = *MEMORY[0x263F00148];
  double v12 = *(double *)(MEMORY[0x263F00148] + 8);
  long long v19 = v27;
  long long v20 = v28;
  long long v21 = v29;
  long long v22 = v30;
  long long v15 = v23;
  long long v16 = v24;
  long long v17 = v25;
  long long v18 = v26;
  -[JFXOverlayEffect effectPointToScreenPoint:effectToScreenTransform:viewSize:](self, "effectPointToScreenPoint:effectToScreenTransform:viewSize:", &v15, v11, v12, width, height);
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (CGPath)newPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8 outExpandedPath:(const CGPath *)a9
{
  double var1 = a8.var1;
  double var0 = a8.var0;
  BOOL v12 = a7;
  uint64_t v13 = *(void *)&a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  BOOL v18 = a4;
  long long v21 = [(JFXEffect *)self renderEffect];
  [(JFXOverlayEffect *)self hitAreaScale];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a3;
  long long v22 = objc_msgSend(v21, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v27, v18, 0, v13);

  ClosedCGPathWithPoints = createClosedCGPathWithPoints(v22);
  if (!v12
    || ($3CC8671D27C23BF42ADDB32F2B5E48AE v27 = *a3,
        -[JFXOverlayEffect JFX_adjustedMinimumSizeFromNormalizedMinimumSize:atTime:forcePosterFrame:relativeTo:basisOrigin:](self, "JFX_adjustedMinimumSizeFromNormalizedMinimumSize:atTime:forcePosterFrame:relativeTo:basisOrigin:", &v27, v18, v13, var0, var1, x, y, width, height), v24 <= 0.0)|| (ExpandedClosedCGPathWithCGPath = createExpandedClosedCGPathWithCGPath(ClosedCGPathWithPoints, v24)) == 0)
  {
    ExpandedClosedCGPathWithCGPath = CGPathRetain(ClosedCGPathWithPoints);
  }
  *a9 = ExpandedClosedCGPathWithCGPath;

  return ClosedCGPathWithPoints;
}

- (BOOL)hitTestPoint:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7 adjustForMinimumSize:(BOOL)a8 normalizedMinimumSize:(id)a9
{
  double var1 = a9.var1;
  double var0 = a9.var0;
  BOOL v11 = a8;
  uint64_t v12 = *(void *)&a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  BOOL v17 = a5;
  CGFloat v19 = a3.y;
  CGFloat v20 = a3.x;
  if ([(JFXOverlayEffect *)self isHidden]) {
    return 0;
  }
  long long v25 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  CGPathRef path = 0;
  long long v23 = -[JFXOverlayEffect newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:](self, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v25, v17, v12, v11, &path, x, y, width, height, var0, var1);
  v28.double x = v20;
  v28.double y = v19;
  BOOL v22 = CGPathContainsPoint(v23, 0, v28, 0);
  if (!v22 && v11)
  {
    v29.double x = v20;
    v29.double y = v19;
    BOOL v22 = CGPathContainsPoint(path, 0, v29, 0);
  }
  CGPathRelease(v23);
  CGPathRelease(path);
  return v22;
}

- (double)JFX_adjustedMinimumSizeFromNormalizedMinimumSize:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  double width = a6.size.width;
  CGFloat height = a6.size.height;
  double var0 = a3.var0;
  float64x2_t v20 = 0u;
  long long v21 = 0u;
  float64x2_t v18 = 0u;
  long long v19 = 0u;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v17, a5, 0, *(void *)&a7, 1.0, 1.0, a6.origin.x, a6.origin.y);
  float64x2_t v8 = vabdq_f64(v20, v18);
  v9.f64[0] = width;
  v9.f64[1] = height;
  int64x2_t v10 = (int64x2_t)vmulq_f64(v8, v8);
  float64x2_t v11 = vmulq_n_f64(v9, 0.2);
  int64x2_t v12 = (int64x2_t)vmulq_f64(v11, v11);
  float64x2_t v13 = vaddq_f64((float64x2_t)vzip1q_s64(v12, v10), (float64x2_t)vzip2q_s64(v12, v10));
  return var0 * width * fmin(fmax(vdivq_f64(v13, (float64x2_t)vdupq_laneq_s64((int64x2_t)v13, 1)).f64[0], 0.0), 1.0);
}

- (CGPoint)closeButtonInset
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F00148];
    uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    BOOL v6 = [(JFXEffect *)self effectID];
    char v7 = [v6 isEqualToString:*MEMORY[0x263F61538]];

    if (v7)
    {
      uint64_t v5 = 0x3F92F1A9FBE76C8BLL;
      uint64_t v4 = 0x3F92F1A9FBE76C8BLL;
    }
    else
    {
      float64x2_t v8 = [(JFXTextEffect *)self editUIProperties];
      float64x2_t v9 = [(JFXEffect *)self effectID];
      int64x2_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        float64x2_t v11 = [v10 objectForKeyedSubscript:@"X"];
        [v11 doubleValue];
        uint64_t v4 = v12;

        float64x2_t v13 = [v10 objectForKeyedSubscript:@"Y"];
        [v13 doubleValue];
        uint64_t v5 = v14;
      }
      else
      {
        uint64_t v4 = *MEMORY[0x263F00148];
        uint64_t v5 = *(void *)(MEMORY[0x263F00148] + 8);
      }
    }
  }
  double v15 = *(double *)&v4;
  double v16 = *(double *)&v5;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)hitAreaScale
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    uint64_t v5 = [v4 initialRotation];

    if (v5)
    {
      [v5 CGPointValue];
      double v7 = v6;
      double v9 = v8;
    }
    else
    {
      double v9 = 1.0;
      double v7 = 1.0;
    }
  }
  else
  {
    uint64_t v5 = [(JFXTextEffect *)self editUIProperties];
    int64x2_t v10 = [(JFXEffect *)self effectID];
    float64x2_t v11 = [v5 objectForKeyedSubscript:v10];

    double v9 = 1.0;
    if (v11
      && ([v11 objectForKeyedSubscript:@"HitAreaScaleX"],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      float64x2_t v13 = (void *)v12;
      uint64_t v14 = [v11 objectForKeyedSubscript:@"HitAreaScaleY"];

      double v7 = 1.0;
      if (v14)
      {
        double v15 = [v11 objectForKeyedSubscript:@"HitAreaScaleX"];
        [v15 doubleValue];
        double v7 = v16 / 100.0;

        $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = [v11 objectForKeyedSubscript:@"HitAreaScaleY"];
        [v17 doubleValue];
        double v9 = v18 / 100.0;
      }
    }
    else
    {
      double v7 = 1.0;
    }
  }
  double v19 = v7;
  double v20 = v9;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (double)pickerScale
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    uint64_t v5 = [v4 pickerScale];

    if (v5)
    {
      [v5 doubleValue];
      double v7 = v6;
    }
    else
    {
      double v7 = 1.0;
    }
  }
  else
  {
    uint64_t v5 = [(JFXTextEffect *)self editUIProperties];
    double v8 = [(JFXEffect *)self effectID];
    double v9 = [v5 objectForKeyedSubscript:v8];

    double v7 = 1.0;
    if (v9)
    {
      int64x2_t v10 = [v9 objectForKeyedSubscript:@"PickerScale"];

      if (v10)
      {
        float64x2_t v11 = [v9 objectForKeyedSubscript:@"PickerScale"];
        [v11 doubleValue];
        double v7 = v12;
      }
    }
  }
  return v7;
}

- (BOOL)includeDropShadowWhenPositioningCloseButton
{
  BOOL v3 = [(JFXEffect *)self effectID];
  if (v3 == (void *)*MEMORY[0x263F61560])
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v4 = [(JFXEffect *)self effectID];
    BOOL v5 = v4 != (void *)*MEMORY[0x263F615B8];
  }
  return v5;
}

- (unint64_t)maxCharacters
{
  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffect;
  unint64_t v3 = [(JFXTextEffect *)&v7 maxCharacters];
  if (v3 == -1)
  {
    if (maxCharacters_onceToken != -1) {
      dispatch_once(&maxCharacters_onceToken, &__block_literal_global_11);
    }
    uint64_t v4 = [(id)maxCharacters_sMaxCharsMap objectForKeyedSubscript:self->super.super._effectID];
    BOOL v5 = v4;
    if (v4) {
      unint64_t v3 = [v4 unsignedIntegerValue];
    }
    else {
      unint64_t v3 = 80;
    }
  }
  return v3;
}

void __33__JFXOverlayEffect_maxCharacters__block_invoke()
{
  v5[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F615B0];
  v4[0] = *MEMORY[0x263F613D8];
  v4[1] = v0;
  v5[0] = &unk_26E8017D0;
  v5[1] = &unk_26E8017E8;
  uint64_t v1 = *MEMORY[0x263F615B8];
  v4[2] = *MEMORY[0x263F61580];
  v4[3] = v1;
  v5[2] = &unk_26E8017E8;
  v5[3] = &unk_26E8017D0;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  unint64_t v3 = (void *)maxCharacters_sMaxCharsMap;
  maxCharacters_sMaxCharsMap = v2;
}

+ (id)effectIDToImageSequenceIDMap
{
  if (effectIDToImageSequenceIDMap_onceToken != -1) {
    dispatch_once(&effectIDToImageSequenceIDMap_onceToken, &__block_literal_global_227);
  }
  uint64_t v2 = (void *)effectIDToImageSequenceIDMap_sEffectToURLMap;
  return v2;
}

void __48__JFXOverlayEffect_effectIDToImageSequenceIDMap__block_invoke()
{
  v9[6] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F614C0];
  uint64_t v1 = *MEMORY[0x263F614D0];
  v8[0] = *MEMORY[0x263F614C8];
  v8[1] = v1;
  v9[0] = v0;
  v9[1] = v0;
  uint64_t v2 = *MEMORY[0x263F614D8];
  uint64_t v3 = *MEMORY[0x263F614E8];
  v8[2] = *MEMORY[0x263F614E0];
  v8[3] = v3;
  v9[2] = v2;
  v9[3] = v2;
  uint64_t v4 = *MEMORY[0x263F614F8];
  uint64_t v5 = *MEMORY[0x263F61508];
  v8[4] = *MEMORY[0x263F61500];
  v8[5] = v5;
  v9[4] = v4;
  v9[5] = v4;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
  objc_super v7 = (void *)effectIDToImageSequenceIDMap_sEffectToURLMap;
  effectIDToImageSequenceIDMap_sEffectToURLMap = v6;
}

- (void)setImageSequencePath:(id)a3
{
}

- (void)setImageSequencePathToBundledAssets
{
  id v10 = +[JFXOverlayEffect effectIDToImageSequenceIDMap];
  uint64_t v3 = [(JFXEffect *)self effectID];
  uint64_t v4 = [v10 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v4 = [(JFXEffect *)self effectID];
  }
  uint64_t v5 = [MEMORY[0x263F086E0] jfxBundle];
  uint64_t v6 = [v5 pathForResource:v4 ofType:0];

  objc_super v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    [(JFXOverlayEffect *)self setImageSequencePath:v6];
  }
}

- (BOOL)enablePresentationState:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffect;
  unsigned int v5 = -[JFXEffect enablePresentationState:](&v16, sel_enablePresentationState_);
  uint64_t v6 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61670]];
  objc_super v7 = v6;
  if (v6) {
    int v8 = [v6 BOOLValue] ^ 1;
  }
  else {
    int v8 = 1;
  }
  if (v8 == v3) {
    int v9 = 1;
  }
  else {
    int v9 = v5;
  }
  id v10 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616C8]];
  if (v10)
  {

    goto LABEL_10;
  }
  float64x2_t v11 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61720]];

  if (v11)
  {
LABEL_10:
    double v12 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61678]];
    float64x2_t v13 = v12;
    if (v12) {
      LODWORD(v12) = [v12 BOOLValue];
    }
    if (v12 == v3) {
      LOBYTE(v9) = 1;
    }

    if (v9) {
      goto LABEL_15;
    }
LABEL_17:
    BOOL v14 = 0;
    goto LABEL_18;
  }
  if (!v9) {
    goto LABEL_17;
  }
LABEL_15:
  [(JFXOverlayEffect *)self setForceRenderAtPosterFrame:v3];
  BOOL v14 = 1;
LABEL_18:

  return v14;
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXOverlayEffect;
  -[JFXEffect setForceRenderAtPosterFrame:](&v9, sel_setForceRenderAtPosterFrame_);
  if ([(JFXOverlayEffect *)self JFX_hasPosterFrame])
  {
    unsigned int v5 = [NSNumber numberWithBool:v3];
    [(JFXEffect *)self setParameter:v5 forKey:*MEMORY[0x263F61670]];
  }
  uint64_t v6 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F616C8]];
  if (v6)
  {
  }
  else
  {
    objc_super v7 = [(JFXEffect *)self parameterForKey:*MEMORY[0x263F61720]];

    if (!v7) {
      return;
    }
  }
  int v8 = [NSNumber numberWithInt:v3 ^ 1];
  [(JFXEffect *)self setParameter:v8 forKey:*MEMORY[0x263F61678]];
}

- (BOOL)loopedRangeRenderIsCacheable
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    char v5 = [v4 loopRenderRangeIsCachable];
  }
  else
  {
    if (loopedRangeRenderIsCacheable_onceToken != -1) {
      dispatch_once(&loopedRangeRenderIsCacheable_onceToken, &__block_literal_global_236);
    }
    uint64_t v6 = (void *)loopedRangeRenderIsCacheable_cacheableEffectIDs;
    uint64_t v4 = [(JFXEffect *)self effectID];
    char v5 = [v6 containsObject:v4];
  }
  BOOL v7 = v5;

  return v7;
}

void __48__JFXOverlayEffect_loopedRangeRenderIsCacheable__block_invoke()
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F613A8];
  v23[0] = *MEMORY[0x263F61420];
  v23[1] = v0;
  uint64_t v1 = *MEMORY[0x263F613D8];
  uint64_t v24 = *MEMORY[0x263F613B0];
  uint64_t v25 = v1;
  uint64_t v2 = *MEMORY[0x263F615B8];
  uint64_t v26 = *MEMORY[0x263F613A0];
  uint64_t v27 = v2;
  uint64_t v3 = *MEMORY[0x263F613D0];
  uint64_t v28 = *MEMORY[0x263F61558];
  uint64_t v29 = v3;
  uint64_t v4 = *MEMORY[0x263F615D8];
  uint64_t v30 = *MEMORY[0x263F615A8];
  uint64_t v31 = v4;
  uint64_t v5 = *MEMORY[0x263F61598];
  uint64_t v32 = *MEMORY[0x263F613B8];
  uint64_t v33 = v5;
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = *MEMORY[0x263F615A0];
  uint64_t v34 = v24;
  uint64_t v35 = v7;
  uint64_t v8 = *MEMORY[0x263F61540];
  uint64_t v36 = *MEMORY[0x263F615D0];
  uint64_t v37 = v8;
  uint64_t v9 = *MEMORY[0x263F615B0];
  uint64_t v38 = *MEMORY[0x263F61560];
  uint64_t v39 = v9;
  uint64_t v10 = *MEMORY[0x263F61388];
  uint64_t v40 = *MEMORY[0x263F61380];
  uint64_t v41 = v10;
  uint64_t v11 = *MEMORY[0x263F61520];
  uint64_t v42 = *MEMORY[0x263F61390];
  uint64_t v43 = v11;
  uint64_t v12 = *MEMORY[0x263F61530];
  uint64_t v44 = *MEMORY[0x263F61528];
  uint64_t v45 = v12;
  uint64_t v13 = *MEMORY[0x263F61570];
  uint64_t v46 = *MEMORY[0x263F61568];
  uint64_t v47 = v13;
  uint64_t v14 = *MEMORY[0x263F61588];
  uint64_t v48 = *MEMORY[0x263F61578];
  uint64_t v49 = v14;
  uint64_t v15 = *MEMORY[0x263F61548];
  uint64_t v50 = *MEMORY[0x263F61398];
  uint64_t v51 = v15;
  uint64_t v16 = *MEMORY[0x263F615E0];
  uint64_t v52 = *MEMORY[0x263F61590];
  uint64_t v53 = v16;
  uint64_t v17 = *MEMORY[0x263F615C8];
  uint64_t v54 = *MEMORY[0x263F615C0];
  uint64_t v55 = v17;
  uint64_t v18 = *MEMORY[0x263F613C0];
  uint64_t v56 = *MEMORY[0x263F61378];
  uint64_t v57 = v18;
  uint64_t v19 = *MEMORY[0x263F61550];
  uint64_t v58 = *MEMORY[0x263F613E0];
  uint64_t v59 = v19;
  double v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:38];
  uint64_t v21 = [v6 setWithArray:v20];
  BOOL v22 = (void *)loopedRangeRenderIsCacheable_cacheableEffectIDs;
  loopedRangeRenderIsCacheable_cacheableEffectIDs = v21;
}

- (BOOL)JFX_hasPosterFrame
{
  uint64_t v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    char v5 = [v4 doesNotHavePosterFrame];
  }
  else
  {
    uint64_t v4 = [(JFXEffect *)self effectID];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F61538]];
  }
  char v6 = v5;

  return v6 ^ 1;
}

- (BOOL)JFX_posterFrameIsCachable
{
  uint64_t v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    int v5 = [v4 posterFrameIsNotCachable] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)JFX_shouldEnableDynamicLineSpacingForDiacritics
{
  uint64_t v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    uint64_t v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    int v5 = [v4 shouldDisableDynamicLineSpacingForDiatrics];

    if (v5)
    {
      char v6 = [v5 BOOLValue];
LABEL_8:
      char v8 = v6 ^ 1;
      goto LABEL_9;
    }
    char v8 = 1;
  }
  else
  {
    uint64_t v7 = (void *)*MEMORY[0x263F61580];
    int v5 = [(JFXEffect *)self effectID];
    if (([v7 isEqualToString:v5] & 1) == 0)
    {
      char v6 = [(JFXOverlayEffect *)self isEmoji];
      goto LABEL_8;
    }
    char v8 = 0;
  }
LABEL_9:

  return v8;
}

- (void)trackedEffectProperties:(id)a3 didChangeTrackingType:(BOOL)a4 didChangeEnabled:(BOOL)a5
{
  if (a4)
  {
    char v6 = +[JFXAnalyticsManager sharedInstance];
    [v6 trackEventWithName:@"facetrackedoverlaychangedplanes"];
  }
  uint64_t v7 = [(JFXOverlayEffect *)self faceTrackingTransform];
  [(JFXOverlayEffect *)self JFX_applyEffectParametersForFaceTrackingTransform:v7];

  [(JFXOverlayEffect *)self JFX_updateInteractiveMode];
}

- (void)JFX_updateInteractiveMode
{
  BOOL v3 = [(JFXOverlayEffect *)self isInteractiveEditing]
    || [(JFXOverlayEffect *)self isCurrentlyTracking];
  id v4 = [(JFXEffect *)self renderEffect];
  [v4 setIsInInteractiveMode:v3];
}

- (void)beginInteractiveEditing
{
}

- (BOOL)isInteractiveEditing
{
  signed int v2 = atomic_load((unsigned int *)&self->_isInteractiveEditingCount);
  return v2 > 0;
}

- (void)endInteractiveEditing
{
}

- (void)beginEditingFaceTrackingTransforms
{
}

- (void)endEditingFaceTrackingTransforms
{
}

- (BOOL)isEditingFaceTrackingTransforms
{
  signed int v2 = atomic_load((unsigned int *)&self->_isEditingFaceTrackingTransformsCount);
  return v2 > 0;
}

- (id)accessibilityName
{
  BOOL v3 = [(JFXOverlayEffect *)self accessibilityOverlayEffectLabel];

  if (v3)
  {
    id v4 = [(JFXOverlayEffect *)self accessibilityOverlayEffectLabel];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)JFXOverlayEffect;
    id v4 = [(JFXEffect *)&v6 accessibilityName];
  }
  return v4;
}

- (BOOL)hasDynamicText
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    id v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    uint64_t v5 = [v4 dynamicTextType];

    LOBYTE(v6) = v5 != 0;
  }
  else
  {
    uint64_t v7 = [(JFXTextEffect *)self editUIProperties];
    char v8 = [(JFXEffect *)self effectID];
    uint64_t v9 = [v7 objectForKeyedSubscript:v8];

    if (v9)
    {
      objc_super v6 = [v9 objectForKeyedSubscript:@"hasDynamicText"];

      if (v6)
      {
        uint64_t v10 = [v9 objectForKeyedSubscript:@"hasDynamicText"];
        LOBYTE(v6) = [v10 BOOLValue];
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return (char)v6;
}

+ (id)dynamicTextPlaceholderMap
{
  if (dynamicTextPlaceholderMap_onceToken != -1) {
    dispatch_once(&dynamicTextPlaceholderMap_onceToken, &__block_literal_global_245);
  }
  signed int v2 = (void *)dynamicTextPlaceholderMap_sDynamicTextMap;
  return v2;
}

void __45__JFXOverlayEffect_dynamicTextPlaceholderMap__block_invoke()
{
  v3[6] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26E801800;
  v2[1] = &unk_26E801818;
  v3[0] = @"<#DATE>";
  v3[1] = @"<#location>";
  v2[2] = &unk_26E801830;
  v2[3] = &unk_26E801848;
  v3[2] = @"<#ABBREVLONGDATE>";
  v3[3] = @"<#temp>";
  v2[4] = &unk_26E801860;
  v2[5] = &unk_26E801878;
  v3[4] = @"<#time>";
  v3[5] = @"<#dayofweek>";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:6];
  uint64_t v1 = (void *)dynamicTextPlaceholderMap_sDynamicTextMap;
  dynamicTextPlaceholderMap_sDynamicTextMap = v0;
}

- (id)JFX_dynamicTextPlaceHolderText
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    id v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    uint64_t v5 = [v4 dynamicTextPlaceholder];
  }
  else
  {
    unint64_t v6 = [(JFXOverlayEffect *)self dynamicTextType];
    id v4 = [(id)objc_opt_class() dynamicTextPlaceholderMap];
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
    uint64_t v5 = [v4 objectForKey:v7];
  }
  return v5;
}

- (unint64_t)dynamicTextType
{
  BOOL v3 = [(JFXEffect *)self contentDataSource];

  if (v3)
  {
    id v4 = [(JFXOverlayEffect *)self overlayContentDataSource];
    unint64_t v5 = [v4 dynamicTextType];
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    uint64_t v15 = 0;
    unint64_t v6 = [(JFXTextEffect *)self defaultAttributedString:0];
    if (v6)
    {
      uint64_t v7 = [(id)objc_opt_class() dynamicTextPlaceholderMap];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __35__JFXOverlayEffect_dynamicTextType__block_invoke;
      v9[3] = &unk_264C0AB10;
      id v10 = v6;
      uint64_t v11 = &v12;
      [v7 enumerateKeysAndObjectsUsingBlock:v9];
    }
    unint64_t v5 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  return v5;
}

void __35__JFXOverlayEffect_dynamicTextType__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  uint64_t v9 = [v7 string];
  uint64_t v10 = [v9 rangeOfString:v8 options:1];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 unsignedIntegerValue];
    *a4 = 1;
  }
}

- (void)setDynamicTextString:(id)a3
{
  id v4 = a3;
  if ([(JFXOverlayEffect *)self hasDynamicText])
  {
    if (v4) {
      [(JFXTextEffect *)self setString:v4 atIndex:0];
    }
    else {
      [(JFXOverlayEffect *)self resetDynamicTextString];
    }
  }
}

- (void)resetDynamicTextString
{
  if ([(JFXOverlayEffect *)self hasDynamicText])
  {
    id v3 = [(JFXOverlayEffect *)self JFX_dynamicTextPlaceHolderText];
    [(JFXTextEffect *)self setString:v3 atIndex:0];
  }
}

- (NSString)dynamicTextString
{
  signed int v2 = [(JFXOverlayEffect *)self JFX_stringAtIndex:0];
  id v3 = 0;
  if (([v2 hasPrefix:@"<#"] & 1) == 0) {
    id v3 = v2;
  }

  return (NSString *)v3;
}

- (void)updateDynamicTextWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke;
  uint64_t v16 = &unk_264C0AB38;
  uint64_t v17 = self;
  id v5 = v4;
  id v18 = v5;
  unint64_t v6 = (void (**)(void, void))MEMORY[0x237DD15A0](&v13);
  switch([(JFXOverlayEffect *)self dynamicTextType])
  {
    case 1uLL:
      uint64_t v7 = [MEMORY[0x263EFF910] date];
      if (updateDynamicTextWithCompletionBlock__onceToken != -1) {
        dispatch_once(&updateDynamicTextWithCompletionBlock__onceToken, &__block_literal_global_281);
      }
      id v8 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
      goto LABEL_12;
    case 4uLL:
      uint64_t v7 = [MEMORY[0x263EFF910] date];
      uint64_t v9 = +[JTFormatters dateFormatterMonthDay];
      goto LABEL_8;
    case 5uLL:
      uint64_t v7 = [MEMORY[0x263EFF910] date];
      uint64_t v9 = +[JTFormatters dateFormatterDayOfWeekMonthDayYear];
LABEL_8:
      uint64_t v10 = v9;
      id v11 = [v9 stringFromDate:v7];

      ((void (**)(void, void *))v6)[2](v6, v11);
      goto LABEL_13;
    case 6uLL:
      uint64_t v7 = [MEMORY[0x263EFF910] date];
      if (updateDynamicTextWithCompletionBlock__onceToken_284 != -1) {
        dispatch_once(&updateDynamicTextWithCompletionBlock__onceToken_284, &__block_literal_global_286);
      }
      id v8 = (void *)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter;
LABEL_12:
      uint64_t v12 = [v8 stringFromDate:v7];
      ((void (**)(void, void *))v6)[2](v6, v12);

LABEL_13:
      break;
    default:
      (*((void (**)(id, void))v5 + 2))(v5, 0);
      break;
  }
}

void __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = &stru_26E7CDB50;
  }
  id v5 = v3;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "JFX_stringAtIndex:", 0);
  if (([(__CFString *)v5 isEqualToString:v4] & 1) == 0) {
    [*(id *)(a1 + 32) setString:v5 atIndex:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke_2()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  updateDynamicTextWithCompletionBlock__s_shortTimeFormatter = v0;

  [(id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter setDateStyle:0];
  [(id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter setTimeStyle:1];
  signed int v2 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  id v3 = [(id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter AMSymbol];
  id v4 = [v3 localizedLowercaseString];
  [v2 setAMSymbol:v4];

  id v5 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  id v7 = [(id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter PMSymbol];
  unint64_t v6 = [v7 localizedLowercaseString];
  [v5 setPMSymbol:v6];
}

uint64_t __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke_3()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter;
  updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter = v0;

  signed int v2 = [MEMORY[0x263EFF960] currentLocale];
  [(id)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter setLocale:v2];

  id v3 = (void *)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter;
  return [v3 setLocalizedDateFormatFromTemplate:@"cccc"];
}

- (BOOL)wasDynamicTextSet
{
  signed int v2 = [(JFXOverlayEffect *)self JFX_stringAtIndex:0];
  id v3 = v2;
  if (v2) {
    int v4 = [v2 hasPrefix:@"<#"] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)JFX_stringAtIndex:(unint64_t)a3
{
  int v4 = (id *)MEMORY[0x263F61778];
  if (a3) {
    int v4 = (id *)MEMORY[0x263F61798];
  }
  id v5 = *v4;
  unint64_t v6 = [(JFXEffect *)self renderEffect];
  id v7 = [v6 effectParameters];

  id v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    uint64_t v9 = [v8 string];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (NSString)accessibilityOverlayEffectLabel
{
  return self->_accessibilityOverlayEffectLabel;
}

- (void)setAccessibilityOverlayEffectLabel:(id)a3
{
}

- (JFXTrackedEffectProperties)trackingProps
{
  return self->_trackingProps;
}

- (BOOL)prefersTrackingNotActivateAutomatically
{
  return self->_prefersTrackingNotActivateAutomatically;
}

- (void)setPrefersTrackingNotActivateAutomatically:(BOOL)a3
{
  self->_prefersTrackingNotActivateAutomaticalldouble y = a3;
}

- (JFXFaceTrackedEffectTransform)internalFaceTrackingTransform
{
  return (JFXFaceTrackedEffectTransform *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInternalFaceTrackingTransform:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalFaceTrackingTransform, 0);
  objc_storeStrong((id *)&self->_trackingProps, 0);
  objc_storeStrong((id *)&self->_accessibilityOverlayEffectLabel, 0);
}

@end