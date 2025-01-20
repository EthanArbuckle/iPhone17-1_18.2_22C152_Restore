@interface MTMaterialLayer
+ (NSSet)mt_animatableKeys;
+ (NSSet)mt_implicitlyAnimatableKeys;
+ (id)_attributeKeys;
+ (id)_unserializedAttributeKeys;
+ (void)initialize;
- (BOOL)_delegateManagesWeighting;
- (BOOL)_didValueChangeForKey:(id)a3 withPendingChange:(id)a4;
- (BOOL)_hasInoperativeAppearance;
- (BOOL)_isDelegateManagingInterpolation;
- (BOOL)_isDelegateManagingOpacity;
- (BOOL)_isInPlaceFilteringPossibleWithSettingsInterpolator:(id)a3;
- (BOOL)_needsPruning;
- (BOOL)allowsInPlaceFiltering;
- (BOOL)isBlurEnabled;
- (BOOL)isContentReplacedWithSnapshot;
- (BOOL)isReduceMotionEnabled;
- (BOOL)isReduceTransparencyEnabled;
- (BOOL)isZoomEnabled;
- (BOOL)shouldArchiveValueForKey:(id)a3;
- (BOOL)shouldCrossfade;
- (MTMaterialLayer)init;
- (NSString)debugIdentifier;
- (NSString)recipeName;
- (double)_backdropScale;
- (id)_effectiveDebugIdentifier;
- (id)backdropScaleAdjustment;
- (id)blurRadiusTransformer;
- (id)defaultBackdropScaleAdjustment;
- (id)description;
- (id)visualStylingProviderForCategory:(id)a3;
- (void)_adjustScaleOfBackdropLayer:(id)a3 ifNecessaryWithSettingsInterpolator:(id)a4;
- (void)_configureBackdropLayer:(id)a3 withSettingsInterpolator:(id)a4 preservingFiltersIfIdentity:(BOOL)a5;
- (void)_configureBackdropLayerIfNecessaryWithSettingsInterpolator:(id)a3;
- (void)_configureDelegateFlagsForDelegate:(id)a3;
- (void)_configureIfNecessaryWithSettingsInterpolator:(id)a3;
- (void)_pruneAtCompletionOfCurrentTransaction;
- (void)_reevaluateDefaultShouldCrossfade;
- (void)_setHasInoperativeAppearance:(BOOL)a3 removingIfIdentity:(BOOL)a4;
- (void)_setNeedsConfiguring;
- (void)_updateForChangeInRecipeAndConfiguration;
- (void)_updateForChangeInWeighting;
- (void)_updateVisualStylingProviders;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)didChangeValueForKey:(id)a3;
- (void)layoutSublayers;
- (void)prune;
- (void)setAllowsInPlaceFiltering:(BOOL)a3;
- (void)setBackdropScaleAdjustment:(id)a3;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setBlurRadiusTransformer:(id)a3;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setDefaultBackdropScaleAdjustment:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecipeName:(id)a3;
- (void)setRecipeName:(id)a3 fromBundle:(id)a4;
- (void)setReduceMotionEnabled:(BOOL)a3;
- (void)setReduceTransparencyEnabled:(BOOL)a3;
- (void)setShouldCrossfade:(BOOL)a3;
- (void)setUnsafeUnretainedDelegate:(id)a3;
- (void)setZoomEnabled:(BOOL)a3;
- (void)willChangeValueForKey:(id)a3;
@end

@implementation MTMaterialLayer

+ (NSSet)mt_implicitlyAnimatableKeys
{
  if (mt_implicitlyAnimatableKeys_onceToken != -1) {
    dispatch_once(&mt_implicitlyAnimatableKeys_onceToken, &__block_literal_global_164);
  }
  v2 = (void *)mt_implicitlyAnimatableKeys___animatableKeyPaths;
  return (NSSet *)v2;
}

- (void)willChangeValueForKey:(id)a3
{
  id v8 = a3;
  if (([v8 isEqualToString:@"recipeSettings"] & 1) != 0
    || ([v8 isEqualToString:@"configuration"] & 1) != 0
    || [v8 isEqualToString:@"weighting"])
  {
    v4 = [(MTMaterialLayer *)self valueForKey:v8];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v7 = v6;

    [(NSMutableDictionary *)self->_pendingChange setObject:v7 forKey:v8];
  }
}

- (void)didChangeValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"recipe"])
  {
    if ([(MTMaterialLayer *)self _didValueChangeForKey:v4 withPendingChange:self->_pendingChange])
    {
      v5 = [(MTMaterialLayer *)self recipe];
      id v6 = MTMaterialSettingsForRecipeFromBundle(v5, 0);
      [(MTMaterialLayer *)self _setRecipeSettings:v6];
    }
  }
  else if (([v4 isEqualToString:@"recipeSettings"] & 1) != 0 {
         || [v4 isEqualToString:@"configuration"])
  }
  {
    if ([(MTMaterialLayer *)self _didValueChangeForKey:v4 withPendingChange:self->_pendingChange])
    {
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer didChangeValueForKey:]();
      }
      [(MTMaterialLayer *)self _updateForChangeInRecipeAndConfiguration];
      if (![(MTMaterialLayer *)self _delegateManagesWeighting])
      {
        v7 = [(MTMaterialLayer *)self _recipeSettings];

        if (v7) {
          [(MTMaterialLayer *)self setWeighting:1.0];
        }
      }
      if ([(MTMaterialLayer *)self _needsPruning]) {
        [(MTMaterialLayer *)self _pruneAtCompletionOfCurrentTransaction];
      }
    }
  }
  else if ([v4 isEqualToString:@"weighting"] {
         && [(MTMaterialLayer *)self _didValueChangeForKey:v4 withPendingChange:self->_pendingChange])
  }
  {
    [(MTMaterialLayer *)self _updateForChangeInWeighting];
  }
  v8.receiver = self;
  v8.super_class = (Class)MTMaterialLayer;
  [(MTMaterialLayer *)&v8 didChangeValueForKey:v4];
}

- (BOOL)_didValueChangeForKey:(id)a3 withPendingChange:(id)a4
{
  id v6 = a3;
  LOBYTE(v7) = 0;
  if (v6 && a4)
  {
    objc_super v8 = [a4 objectForKey:v6];
    v9 = [MEMORY[0x1E4F1CA98] null];

    if (v8 == v9)
    {

      objc_super v8 = 0;
    }
    v10 = [(MTMaterialLayer *)self valueForKey:v6];
    if ((v8 == 0) == (v10 != 0)) {
      LOBYTE(v7) = 1;
    }
    else {
      int v7 = [v8 isEqual:v10] ^ 1;
    }
  }
  return v7;
}

- (void)_updateForChangeInWeighting
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSMutableDictionary *)self->_pendingChange removeAllObjects];
  [(MTMaterialLayer *)self weighting];
  double v4 = fmin(v3, 1.0);
  double v5 = fmax(v4, 0.0);
  settingsInterpolator = self->_settingsInterpolator;
  if (!settingsInterpolator)
  {
    int v7 = [MTMaterialSettingsInterpolator alloc];
    objc_super v8 = [(MTMaterialLayer *)self _recipeSettings];
    v9 = [(MTMaterialSettingsInterpolator *)v7 initWithSettings:v8];
    v10 = self->_settingsInterpolator;
    self->_settingsInterpolator = v9;

    settingsInterpolator = self->_settingsInterpolator;
  }
  [(MTMaterialSettingsInterpolator *)settingsInterpolator setWeighting:v5];
  [(MTMaterialLayer *)self _configureIfNecessaryWithSettingsInterpolator:self->_settingsInterpolator];
  if (!self->_reduceMotionEnabled)
  {
    if (![(MTMaterialLayer *)self _isDelegateManagingOpacity])
    {
      LODWORD(v11) = 1.0;
      [(MTMaterialLayer *)self setOpacity:v11];
    }
    if (self->_shouldCrossfade)
    {
      if ([(MTMaterialLayer *)self _isDelegateManagingInterpolation])
      {
        if (![(MTMaterialLayer *)self _isDelegateManagingOpacity])
        {
          HIDWORD(v12) = 1068079513;
          *(float *)&double v12 = v5 / 0.05;
          [(MTMaterialLayer *)self setOpacity:v12];
          v13 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v18 = 138543874;
            *(void *)&v18[4] = self;
            *(_WORD *)&v18[12] = 2050;
            *(double *)&v18[14] = v5;
            *(_WORD *)&v18[22] = 2050;
            double v19 = v5 / 0.05;
            v14 = "%{public}@: Performing crossfade with weighting: %{public}f; alpha: %{public}f";
LABEL_20:
            _os_log_debug_impl(&dword_1AE9D6000, v13, OS_LOG_TYPE_DEBUG, v14, v18, 0x20u);
          }
        }
      }
      else
      {
        if (v4 <= 0.0) {
          double v15 = 20.0;
        }
        else {
          double v15 = 0.0;
        }
        *(float *)&double v15 = v15;
        if (v4 <= 0.0) {
          double v16 = 0.0;
        }
        else {
          double v16 = 20.0;
        }
        [(MTMaterialLayer *)self setOpacity:v15];
        *(float *)&double v17 = v16;
        [(MTMaterialLayer *)self setOpacity:v17];
        v13 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v18 = 138543874;
          *(void *)&v18[4] = self;
          *(_WORD *)&v18[12] = 2050;
          *(double *)&v18[14] = v5;
          *(_WORD *)&v18[22] = 2050;
          double v19 = v16;
          v14 = "%{public}@: Performing necessary crossfade with weighting: %{public}f; alpha: %{public}f";
          goto LABEL_20;
        }
      }
    }
  }
  [(MTMaterialLayer *)self _updateVisualStylingProviders];
}

- (void)_updateVisualStylingProviders
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_visualStyleCategoriesToProviders;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        objc_super v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_visualStyleCategoriesToProviders objectForKey:v8];
        [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator weighting];
        double v11 = v10;
        if (v10 < 0.5
          && ([(MTMaterialSettingsInterpolator *)self->_settingsInterpolator initialSettings],
              (v2 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          double v12 = [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator initialSettings];
          v13 = [v12 recipeName];
        }
        else
        {
          v14 = [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator finalSettings];
          v13 = [v14 recipeName];

          if (v11 >= 0.5) {
            goto LABEL_11;
          }
        }

LABEL_11:
        double v15 = MTSharedVisualStyleSetForRecipeAndCategory(v13, v8);
        [v9 _setVisualStyleSet:v15];
      }
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (void)_configureIfNecessaryWithSettingsInterpolator:(id)a3
{
  self->_needsConfiguring = 0;
  [(MTMaterialLayer *)self setBackgroundColor:0];
  uint64_t v4 = [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator finalSettings];

  if (v4)
  {
    [(MTMaterialLayer *)self _configureBackdropLayerIfNecessaryWithSettingsInterpolator:self->_settingsInterpolator];
  }
  else if (![(MTMaterialLayer *)self _delegateManagesWeighting])
  {
    id v5 = +[MTColor pinkColor];
    -[MTMaterialLayer setBackgroundColor:](self, "setBackgroundColor:", [v5 CGColor]);
  }
  [(MTMaterialLayer *)self setNeedsLayout];
}

- (void)_configureBackdropLayerIfNecessaryWithSettingsInterpolator:(id)a3
{
  id v4 = a3;
  if ([v4 isBackdropRequiredEver])
  {
    [(MTMaterialLayer *)self setEnabled:!self->_contentReplacedWithSnapshot];
    if ([v4 isWeightingChanging])
    {
      BOOL v5 = 1;
    }
    else
    {
      [v4 weighting];
      BOOL v5 = v7 == 0.0;
    }
    [(MTMaterialLayer *)self _configureBackdropLayer:self withSettingsInterpolator:v4 preservingFiltersIfIdentity:v5];
    if (self->_allowsInPlaceFiltering == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8.receiver = self;
      v8.super_class = (Class)MTMaterialLayer;
      [(MTMaterialLayer *)&v8 setAllowsInPlaceFiltering:[(MTMaterialLayer *)self _isInPlaceFilteringPossibleWithSettingsInterpolator:v4]];
    }
  }
  else if (([(MTMaterialLayer *)self captureOnly] & 1) == 0)
  {
    [(MTMaterialLayer *)self setFilters:0];
    [(MTMaterialLayer *)self setEnabled:0];
    id v6 = [v4 tintColor];
    -[MTMaterialLayer setBackgroundColor:](self, "setBackgroundColor:", [v6 CGColor]);
  }
}

- (BOOL)_isDelegateManagingOpacity
{
  if ((*(unsigned char *)&self->_materialLayerDelegateFlags & 2) == 0) {
    return 0;
  }
  double v3 = self;
  id v4 = [(MTMaterialLayer *)self delegate];
  LOBYTE(v3) = [v4 isManagingOpacityForMaterialLayer:v3];

  return (char)v3;
}

id __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"inputQuality";
  v1 = [*(id *)(a1 + 32) blurInputQuality];
  v5[0] = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_updateForChangeInRecipeAndConfiguration
{
  [(NSMutableDictionary *)self->_pendingChange removeAllObjects];
  objc_storeStrong((id *)&self->_previousSettingsInterpolator, self->_settingsInterpolator);
  double v3 = [MTMaterialSettingsInterpolator alloc];
  id v4 = [(MTMaterialLayer *)self _recipeSettings];
  BOOL v5 = [(MTMaterialSettingsInterpolator *)v3 initWithSettings:v4];
  settingsInterpolator = self->_settingsInterpolator;
  self->_settingsInterpolator = v5;

  double v7 = self->_settingsInterpolator;
  objc_super v8 = [(MTMaterialSettingsInterpolator *)self->_previousSettingsInterpolator finalSettings];
  [(MTMaterialSettingsInterpolator *)v7 setInitialSettings:v8];

  if (self->_previousSettingsInterpolator) {
    [(MTMaterialLayer *)self setWeighting:0.0];
  }
  else {
    [(MTMaterialLayer *)self _configureIfNecessaryWithSettingsInterpolator:self->_settingsInterpolator];
  }
  [(MTMaterialLayer *)self _updateVisualStylingProviders];
}

- (NSString)recipeName
{
  v2 = [(MTMaterialLayer *)self _recipeSettings];
  double v3 = [v2 recipeName];

  return (NSString *)v3;
}

- (BOOL)_needsPruning
{
  v2 = [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator initialSettings];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_delegateManagesWeighting
{
  return *(unsigned char *)&self->_materialLayerDelegateFlags & 1;
}

- (void)_configureBackdropLayer:(id)a3 withSettingsInterpolator:(id)a4 preservingFiltersIfIdentity:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (MTMaterialSettingsInterpolator *)a4;
  double v10 = v9;
  if (v8)
  {
    [(MTMaterialSettingsInterpolator *)v9 weighting];
    double v12 = v11;
    if (self->_reduceMotionEnabled
      && ([(MTMaterialSettingsInterpolator *)v10 initialSettings],
          v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      v14 = [MTMaterialSettingsInterpolator alloc];
      double v15 = [(MTMaterialSettingsInterpolator *)v10 finalSettings];
      double v16 = [(MTMaterialSettingsInterpolator *)v14 initWithSettings:v15];

      [(MTMaterialSettingsInterpolator *)v16 setWeighting:1.0];
      char v40 = 1;
      double v10 = v16;
    }
    else
    {
      char v40 = 0;
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
      -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.9();
    }
    if (self->_blurEnabled && [(MTMaterialSettingsInterpolator *)v10 isBlurEnabled])
    {
      [(MTMaterialLayer *)self _adjustScaleOfBackdropLayer:v8 ifNecessaryWithSettingsInterpolator:v10];
      if (self->_reduceTransparencyEnabled)
      {
        [v17 setAverageColorEnabled:1 includingOptimizations:1 withAdditionalInfoPromise:0];
        long long v18 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
          -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.8((uint64_t)self, v18);
        }
      }
      else
      {
        [(MTMaterialSettingsInterpolator *)v10 blurRadius];
        double v34 = v33;
        v35 = v10;
        uint64_t v36 = [(MTMaterialSettingsInterpolator *)v35 variableBlurInputMask];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke;
        v41[3] = &unk_1E5F1B3F8;
        v42 = v35;
        [v17 setBlurRadius:v36 inputMaskImage:0 ignoringIdentity:1 includingOptimizations:v41 withAdditionalInfoPromise:v34];
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
          -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.7();
        }
      }
    }
    else
    {
      [v8 setScale:1.0];
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isAverageColorEnabledEver]) {
      objc_msgSend(v17, "setAverageColorEnabled:includingOptimizations:withAdditionalInfoPromise:", -[MTMaterialSettingsInterpolator isAverageColorEnabled](v10, "isAverageColorEnabled"), 1, 0);
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isLuminanceEnabled])
    {
      [(MTMaterialSettingsInterpolator *)v10 luminanceAmount];
      double v20 = v19;
      v21 = [(MTMaterialSettingsInterpolator *)v10 luminanceValues];
      if (v21) {
        uint64_t v22 = 0;
      }
      else {
        uint64_t v22 = &__block_literal_global;
      }
      [v17 setLuminanceAmount:v21 values:0 ignoringIdentity:1 includingOptimizations:v22 withAdditionalInfoPromise:v20];
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.6();
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isCurvesEnabled])
    {
      v23 = [(MTMaterialSettingsInterpolator *)v10 curvesValues];
      [v17 setCurvesInputValues:v23 ignoringIdentity:0 includingOptimizations:1 withAdditionalInfoPromise:0];
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.5();
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isSaturationEnabled])
    {
      [(MTMaterialSettingsInterpolator *)v10 saturation];
      objc_msgSend(v17, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 0, 1, 0);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.4();
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isBrightnessEnabled])
    {
      [(MTMaterialSettingsInterpolator *)v10 brightness];
      objc_msgSend(v17, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 0, 1, 0);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:]();
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isColorMatrixEnabled])
    {
      if (v10) {
        [(MTMaterialSettingsInterpolator *)v10 colorMatrix];
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      memset(buf, 0, sizeof(buf));
      [v17 setColorMatrix:buf ignoringIdentity:0 includingOptimizations:1 withAdditionalInfoPromise:0];
      v24 = (void *)MTLogMaterials;
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
      {
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        memset(buf, 0, sizeof(buf));
        v37 = v24;
        v39 = MTCAColorMatrixCreateDictionaryRepresentation(buf, v38);
        *(_DWORD *)buf = 138543618;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v39;
        _os_log_debug_impl(&dword_1AE9D6000, v37, OS_LOG_TYPE_DEBUG, "%{public}@: Updated brightness: %{public}@", buf, 0x16u);
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isTintEnabled])
    {
      v25 = [(MTMaterialSettingsInterpolator *)v10 tintColor];
      [v17 setTintColor:v25 includingOptimizations:1 withAdditionalInfoPromise:0];
      if (v25 && os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:]();
      }
    }
    BOOL v26 = self->_reduceTransparencyEnabled || self->_reduceMotionEnabled;
    if (self->_zoomEnabled && [(MTMaterialSettingsInterpolator *)v10 isZoomEnabled])
    {
      double v27 = 0.0;
      if (!v26)
      {
        [(MTMaterialSettingsInterpolator *)v10 zoom];
        double v27 = v28;
      }
      [v17 setZoom:0 ignoringIdentity:1 includingOptimizations:0 withAdditionalInfoPromise:v27];
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG)) {
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:]();
      }
    }
    if ([(MTMaterialSettingsInterpolator *)v10 isBlurAtEnd]) {
      objc_msgSend(MEMORY[0x1E4F39B40], "mt_orderedFilterTypesBlurAtEnd");
    }
    else {
    v29 = objc_msgSend(MEMORY[0x1E4F39B40], "mt_orderedFilterTypes");
    }
    [v17 sortFiltersWithOrder:v29];
    BOOL v30 = !v5;
    objc_msgSend(v8, "mt_applyMaterialDescription:removingIfIdentity:", v17, v30);
    if ((v40 & 1) != 0
      || (double v32 = 1.0, self->_blurEnabled)
      && [(MTMaterialSettingsInterpolator *)v10 isBlurEnabled]
      && self->_reduceTransparencyEnabled)
    {
      int v31 = 0;
      double v32 = v12;
    }
    else
    {
      int v31 = 1;
    }
    [(MTMaterialLayer *)self _setPrivateOpacity:v31 | v30 removingIfIdentity:v32];
  }
}

- (void)_adjustScaleOfBackdropLayer:(id)a3 ifNecessaryWithSettingsInterpolator:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MTDynamicBlurRadiusGraphicsQuality();
  if (!self->_blurEnabled) {
    goto LABEL_21;
  }
  uint64_t v9 = v8;
  if (![v7 isBlurEnabled] || self->_reduceTransparencyEnabled) {
    goto LABEL_21;
  }
  [v7 backdropScale];
  double v11 = v10;
  id backdropScaleAdjustment = self->_backdropScaleAdjustment;
  if (backdropScaleAdjustment || v9 != 100)
  {
    if (backdropScaleAdjustment) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  if (v10 > 0.0 && v10 < 1.0)
  {
LABEL_10:
    if (v10 > 0.0 && v10 < 1.0)
    {
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      BOOL v30 = __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke;
      int v31 = &__block_descriptor_40_e8_d16__0d8l;
      double v32 = v10;
LABEL_15:
      -[MTMaterialLayer setDefaultBackdropScaleAdjustment:](self, "setDefaultBackdropScaleAdjustment:", v23, v24, v25, v26, v27, v28, v29, v30, v31, *(void *)&v32);
      goto LABEL_16;
    }
    if (v9 != 100)
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke_2;
      BOOL v26 = &__block_descriptor_40_e8_d16__0d8l;
      uint64_t v27 = v9;
      goto LABEL_15;
    }
LABEL_16:
    v14 = objc_msgSend(NSNumber, "mt_identityValueForMaterialSettingsProperty:", @"backdropScale");
    [v14 floatValue];
    float v16 = v15;

    defaultBackdropScaleAdjustment = (double (**)(id))self->_backdropScaleAdjustment;
    if (defaultBackdropScaleAdjustment
      || (defaultBackdropScaleAdjustment = (double (**)(id))self->_defaultBackdropScaleAdjustment) != 0)
    {
      [v7 weighting];
      double v11 = defaultBackdropScaleAdjustment[2](defaultBackdropScaleAdjustment);
    }
    else
    {
      double v11 = v16;
    }
    goto LABEL_19;
  }
  id v13 = self->_defaultBackdropScaleAdjustment;
  self->_defaultBackdropScaleAdjustment = 0;

LABEL_19:
  [(MTMaterialLayer *)self setScale:v11];
  long long v18 = (void *)MTLogMaterials;
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
  {
    double v19 = v18;
    [v7 weighting];
    uint64_t v21 = v20;
    [v6 scale];
    *(_DWORD *)buf = 138543874;
    double v34 = self;
    __int16 v35 = 2050;
    uint64_t v36 = v21;
    __int16 v37 = 2050;
    uint64_t v38 = v22;
    _os_log_debug_impl(&dword_1AE9D6000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: weighting: %{public}f; backdrop scale: %{public}f",
      buf,
      0x20u);
  }
LABEL_21:
}

double __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)setDefaultBackdropScaleAdjustment:(id)a3
{
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  if (self->_backdropScaleAdjustment != a3)
  {
    id v4 = (void *)[a3 copy];
    id backdropScaleAdjustment = self->_backdropScaleAdjustment;
    self->_id backdropScaleAdjustment = v4;

    [(MTMaterialLayer *)self _setNeedsConfiguring];
  }
}

- (void)setRecipeName:(id)a3 fromBundle:(id)a4
{
  MTMaterialSettingsForRecipeFromBundle(a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(MTMaterialLayer *)self _setRecipeSettings:v5];
}

- (void)layoutSublayers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)MTMaterialLayer;
  [(MTMaterialLayer *)&v17 layoutSublayers];
  if (self->_needsConfiguring) {
    [(MTMaterialLayer *)self _configureIfNecessaryWithSettingsInterpolator:self->_settingsInterpolator];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v3 = (void *)[(NSHashTable *)self->_prunePromises copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138543618;
    long long v12 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "timeIntervalSincePromise", v12);
        if (v10 < -5.0)
        {
          double v11 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            double v19 = self;
            __int16 v20 = 2114;
            uint64_t v21 = v9;
            _os_log_error_impl(&dword_1AE9D6000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Found expired prune promise: %{public}@", buf, 0x16u);
          }
          [v9 fulfillPromise];
          [(NSHashTable *)self->_prunePromises removeObject:v9];
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v13 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    [(MTMaterialLayer *)self _setNeedsConfiguring];
  }
}

- (MTMaterialLayer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTMaterialLayer;
  v2 = [(MTMaterialLayer *)&v6 init];
  if (v2)
  {
    BOOL v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingChange = v2->_pendingChange;
    v2->_pendingChange = v3;

    [(MTMaterialLayer *)v2 _reevaluateDefaultShouldCrossfade];
    v2->_blurEnabled = 1;
    v2->_zoomEnabled = 1;
    v2->_allowsInPlaceFiltering = 0x7FFFFFFFFFFFFFFFLL;
    [(MTMaterialLayer *)v2 setAllowsGroupBlending:0];
    [(MTMaterialLayer *)v2 _setNeedsConfiguring];
  }
  return v2;
}

- (void)_setNeedsConfiguring
{
  self->_needsConfiguring = 1;
  [(MTMaterialLayer *)self setNeedsLayout];
}

- (void)_reevaluateDefaultShouldCrossfade
{
  self->_shouldCrossfade = MTDynamicBlurRadiusGraphicsQuality() != 100;
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabled = a3;
  if (a3) {
    [(MTMaterialLayer *)self _setNeedsConfiguring];
  }
  else {
    [(MTMaterialLayer *)self setZoom:0.0];
  }
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  if (self->_reduceTransparencyEnabled != a3)
  {
    self->_reduceTransparencyEnabled = a3;
    [(MTMaterialLayer *)self _setNeedsConfiguring];
  }
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
  if (self->_reduceMotionEnabled != a3)
  {
    self->_reduceMotionEnabled = a3;
    [(MTMaterialLayer *)self _setNeedsConfiguring];
  }
}

- (BOOL)allowsInPlaceFiltering
{
  v3.receiver = self;
  v3.super_class = (Class)MTMaterialLayer;
  return [(MTMaterialLayer *)&v3 allowsInPlaceFiltering];
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialLayer;
  id v4 = a3;
  [(MTMaterialLayer *)&v5 setUnsafeUnretainedDelegate:v4];
  -[MTMaterialLayer _configureDelegateFlagsForDelegate:](self, "_configureDelegateFlagsForDelegate:", v4, v5.receiver, v5.super_class);
}

- (void)_configureDelegateFlagsForDelegate:(id)a3
{
  id v7 = a3;
  if (objc_opt_respondsToSelector()) {
    char v4 = [v7 managesWeightingForMaterialLayer:self];
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_materialLayerDelegateFlags = *(unsigned char *)&self->_materialLayerDelegateFlags & 0xFE | v4;
  if (objc_opt_respondsToSelector()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_materialLayerDelegateFlags = *(unsigned char *)&self->_materialLayerDelegateFlags & 0xFD | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_materialLayerDelegateFlags = *(unsigned char *)&self->_materialLayerDelegateFlags & 0xFB | v6;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

- (void)setBlurRadiusTransformer:(id)a3
{
}

- (double)_backdropScale
{
  [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator backdropScale];
  return result;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  v41[9] = *MEMORY[0x1E4F143B8];
  if (self->_contentReplacedWithSnapshot != a3)
  {
    if (a3)
    {
      [(MTMaterialLayer *)self bounds];
      CGFloat v5 = v4;
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      double v12 = MTBuiltInScreenScale();
      v43.origin.x = v5;
      v43.origin.y = v7;
      v43.size.width = v9;
      v43.size.height = v11;
      double v13 = v12 * CGRectGetWidth(v43);
      v44.origin.x = v5;
      v44.origin.y = v7;
      v44.size.width = v9;
      v44.size.height = v11;
      CGFloat Height = CGRectGetHeight(v44);
      IOSurfaceRef v15 = MTIOSurfaceCreate(0, v13, v12 * Height);
      if (v15)
      {
        IOSurfaceRef v16 = v15;
        memset(&v39, 0, sizeof(v39));
        v45.origin.x = v5;
        v45.origin.y = v7;
        v45.size.width = v9;
        v45.size.height = v11;
        CGFloat v17 = -CGRectGetMinX(v45);
        v46.origin.x = v5;
        v46.origin.y = v7;
        v46.size.width = v9;
        v46.size.height = v11;
        CGFloat MinY = CGRectGetMinY(v46);
        CATransform3DMakeTranslation(&a, v17, -MinY, 0.0);
        CATransform3DMakeScale(&b, v12, v12, 1.0);
        CATransform3DConcat(&v39, &a, &b);
        uint64_t v19 = *MEMORY[0x1E4F3A538];
        v41[0] = *MEMORY[0x1E4F3A558];
        uint64_t v20 = *MEMORY[0x1E4F3A4F8];
        v40[0] = v19;
        v40[1] = v20;
        uint64_t v21 = [MEMORY[0x1E4F39B60] mainDisplay];
        uint64_t v22 = [v21 name];
        uint64_t v23 = *MEMORY[0x1E4F3A4F0];
        v41[1] = v22;
        v41[2] = v16;
        uint64_t v24 = *MEMORY[0x1E4F3A588];
        v40[2] = v23;
        v40[3] = v24;
        CATransform3D v36 = v39;
        v25 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v36];
        uint64_t v26 = *MEMORY[0x1E4F3A578];
        v41[3] = v25;
        void v41[4] = MEMORY[0x1E4F1CC38];
        uint64_t v27 = *MEMORY[0x1E4F3A580];
        v40[4] = v26;
        v40[5] = v27;
        v41[5] = MEMORY[0x1E4F1CC38];
        v41[6] = MEMORY[0x1E4F1CC38];
        uint64_t v28 = *MEMORY[0x1E4F3A4E0];
        v40[6] = *MEMORY[0x1E4F3A528];
        v40[7] = v28;
        uint64_t v29 = NSNumber;
        BOOL v30 = [(MTMaterialLayer *)self context];
        int v31 = objc_msgSend(v29, "numberWithUnsignedInt:", objc_msgSend(v30, "contextId"));
        v41[7] = v31;
        v40[8] = *MEMORY[0x1E4F3A530];
        double v32 = [NSNumber numberWithUnsignedLongLong:self];
        v41[8] = v32;
        double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:9];

        if (CARenderServerSnapshot())
        {
          self->_contentReplacedWithSnapshot = 1;
          [(MTMaterialLayer *)self setEnabled:0];
          [(MTMaterialLayer *)self setFilters:0];
          [(MTMaterialLayer *)self setContents:v16];
          [(MTMaterialLayer *)self setMasksToBounds:1];
        }
        else
        {
          __int16 v35 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
            -[MTMaterialLayer(Private) setContentReplacedWithSnapshot:]((uint64_t)self, v35);
          }
        }
        CFRelease(v16);
      }
      else
      {
        double v34 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
          -[MTMaterialLayer(Private) setContentReplacedWithSnapshot:]((uint64_t)self, v34);
        }
      }
    }
    else
    {
      self->_contentReplacedWithSnapshot = 0;
      [(MTMaterialLayer *)self setContents:0];
      [(MTMaterialLayer *)self setEnabled:1];
      [(MTMaterialLayer *)self setMasksToBounds:0];
      [(MTMaterialLayer *)self _setNeedsConfiguring];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_prunePromises, 0);
  objc_storeStrong((id *)&self->_visualStyleCategoriesToProviders, 0);
  objc_storeStrong((id *)&self->_pendingChange, 0);
  objc_storeStrong(&self->_defaultBackdropScaleAdjustment, 0);
  objc_storeStrong(&self->_backdropScaleAdjustment, 0);
  objc_storeStrong((id *)&self->_previousSettingsInterpolator, 0);
  objc_storeStrong((id *)&self->_settingsInterpolator, 0);
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    MTRegisterCoreMaterialLogging();
  }
}

- (void)_pruneAtCompletionOfCurrentTransaction
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = [[MTPrunePromise alloc] initWithMaterialLayer:self];
  prunePromises = self->_prunePromises;
  if (!prunePromises)
  {
    CGFloat v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    double v6 = self->_prunePromises;
    self->_prunePromises = v5;

    prunePromises = self->_prunePromises;
  }
  [(NSHashTable *)prunePromises addObject:v3];
  CGFloat v7 = [(MTMaterialLayer *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke;
    v18[3] = &unk_1E5F1B3D0;
    double v8 = v3;
    uint64_t v19 = v8;
    id v17 = 0;
    int v9 = [v7 addCompletionForCurrentAnimation:v18 forMaterialLayer:self reason:&v17];
    double v10 = (MTPrunePromise *)v17;
    CGFloat v11 = MTLogMaterials;
    BOOL v12 = os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = self;
        _os_log_impl(&dword_1AE9D6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate successfully added completion", buf, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v21 = self;
        __int16 v22 = 2114;
        uint64_t v23 = v10;
        _os_log_impl(&dword_1AE9D6000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate didn't add completion (%{public}@) – pruning immediately", buf, 0x16u);
      }
      [(MTPrunePromise *)v8 fulfillPromise];
    }
  }
  else
  {
    double v13 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = self;
      _os_log_impl(&dword_1AE9D6000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate doesn't handle completions – adding to current transaction", buf, 0xCu);
    }
    long long v14 = (void *)MEMORY[0x1E4F39CF8];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke_4;
    v15[3] = &unk_1E5F1B3D0;
    IOSurfaceRef v16 = v3;
    objc_msgSend(v14, "mt_addCompletionBlock:", v15);
    double v10 = v16;
  }
}

uint64_t __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fulfillPromise];
}

uint64_t __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) fulfillPromise];
}

- (id)visualStylingProviderForCategory:(id)a3
{
  double v4 = (__CFString *)a3;
  CGFloat v5 = v4;
  double v6 = 0;
  if (v4)
  {
    if (@"none" != v4)
    {
      double v6 = [(NSMutableDictionary *)self->_visualStyleCategoriesToProviders objectForKey:v4];
      if (!v6)
      {
        if (!self->_visualStyleCategoriesToProviders)
        {
          CGFloat v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          visualStyleCategoriesToProviders = self->_visualStyleCategoriesToProviders;
          self->_visualStyleCategoriesToProviders = v7;
        }
        double v6 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
        [(NSMutableDictionary *)self->_visualStyleCategoriesToProviders setObject:v6 forKey:v5];
        [(MTMaterialLayer *)self _updateVisualStylingProviders];
      }
    }
  }

  return v6;
}

- (void)prune
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(MTMaterialLayer *)self _needsPruning])
  {
    id v3 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      double v6 = self;
      _os_log_impl(&dword_1AE9D6000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Pruning", (uint8_t *)&v5, 0xCu);
    }
    previousSettingsInterpolator = self->_previousSettingsInterpolator;
    self->_previousSettingsInterpolator = 0;

    [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator setInitialSettings:0];
    [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator finalizeWeighting];
    [(MTMaterialLayer *)self _configureIfNecessaryWithSettingsInterpolator:self->_settingsInterpolator];
  }
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialLayer;
  id v4 = a3;
  [(MTMaterialLayer *)&v5 setDelegate:v4];
  -[MTMaterialLayer _configureDelegateFlagsForDelegate:](self, "_configureDelegateFlagsForDelegate:", v4, v5.receiver, v5.super_class);
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (![(MTMaterialLayer *)self _delegateManagesWeighting]
    && [v7 isEqualToString:@"filters"])
  {

    goto LABEL_25;
  }
  int v9 = v8;
  if ([(MTMaterialLayer *)self _delegateManagesWeighting]) {
    goto LABEL_23;
  }
  double v10 = objc_msgSend((id)objc_opt_class(), "mt_implicitlyAnimatableKeys");
  int v11 = [v10 containsObject:v7];

  int v9 = v8;
  if (!v11) {
    goto LABEL_23;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v12 = objc_msgSend((id)objc_opt_class(), "mt_animatableKeys");
  uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v13)
  {
LABEL_17:
    uint64_t v19 = v12;
    goto LABEL_21;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v26;
LABEL_8:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v26 != v15) {
      objc_enumerationMutation(v12);
    }
    uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * v16);
    long long v18 = [(MTMaterialLayer *)self animationForKey:v17];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_15;
    }
    uint64_t v19 = [(MTMaterialLayer *)self animationForKey:v17];

    if (v19) {
      break;
    }
LABEL_15:
    if (v14 == ++v16)
    {
      uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v14) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    id v21 = v8;
    int v9 = (void *)[v19 copy];
    [v9 setToValue:0];
    [v9 setByValue:0];
    __int16 v22 = [v21 keyPath];
    [v9 setKeyPath:v22];

    uint64_t v23 = [v21 fromValue];
    [v9 setFromValue:v23];

    goto LABEL_22;
  }
LABEL_21:
  int v9 = v8;
LABEL_22:

LABEL_23:
  if (v9)
  {
    v24.receiver = self;
    v24.super_class = (Class)MTMaterialLayer;
    [(MTMaterialLayer *)&v24 addAnimation:v9 forKey:v7];
  }
LABEL_25:
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(id)objc_opt_class() _unserializedAttributeKeys];
  if ([v5 containsObject:v4])
  {
    BOOL v6 = 0;
  }
  else
  {
    id v7 = [(id)objc_opt_class() _attributeKeys];
    if ([v7 containsObject:v4])
    {
      BOOL v6 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MTMaterialLayer;
      BOOL v6 = [(MTMaterialLayer *)&v9 shouldArchiveValueForKey:v4];
    }
  }
  return v6;
}

- (void)setAllowsInPlaceFiltering:(BOOL)a3
{
  if (self->_allowsInPlaceFiltering != a3)
  {
    self->_allowsInPlaceFiltering = a3;
    v3.receiver = self;
    v3.super_class = (Class)MTMaterialLayer;
    -[MTMaterialLayer setAllowsInPlaceFiltering:](&v3, sel_setAllowsInPlaceFiltering_);
  }
}

- (BOOL)_isInPlaceFilteringPossibleWithSettingsInterpolator:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (self->_blurEnabled && ([v4 isBlurEnabled] & 1) != 0) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = [v5 isAverageColorEnabledEver] ^ 1;
  }

  return v6;
}

id __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke_44()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MTDefaultLuminanceColorMap();
  if (v0)
  {
    v2 = @"inputColorMap";
    v3[0] = v0;
    v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  }
  return v0;
}

double __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke_2()
{
  return _MTDefaultBackdropScaleAdjustmentForWeighting();
}

+ (id)_attributeKeys
{
  if (_attributeKeys_onceToken != -1) {
    dispatch_once(&_attributeKeys_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)_attributeKeys___attributeKeys;
  return v2;
}

uint64_t __33__MTMaterialLayer__attributeKeys__block_invoke()
{
  _attributeKeys___attributeKeys = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"recipe", @"configuration", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)_unserializedAttributeKeys
{
  if (_unserializedAttributeKeys_onceToken != -1) {
    dispatch_once(&_unserializedAttributeKeys_onceToken, &__block_literal_global_55);
  }
  v2 = (void *)_unserializedAttributeKeys___attributeKeys;
  return v2;
}

uint64_t __45__MTMaterialLayer__unserializedAttributeKeys__block_invoke()
{
  _unserializedAttributeKeys___attributeKeys = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"sublayers", 0);
  return MEMORY[0x1F41817F8]();
}

- (BOOL)_isDelegateManagingInterpolation
{
  if ((*(unsigned char *)&self->_materialLayerDelegateFlags & 4) == 0) {
    return 0;
  }
  objc_super v3 = self;
  id v4 = [(MTMaterialLayer *)self delegate];
  LOBYTE(v3) = [v4 isManagingInterpolationForMaterialLayer:v3];

  return (char)v3;
}

- (id)_effectiveDebugIdentifier
{
  debugIdentifier = self->_debugIdentifier;
  if (debugIdentifier)
  {
    objc_super v3 = debugIdentifier;
  }
  else
  {
    objc_super v3 = [(MTMaterialLayer *)self groupName];
  }
  return v3;
}

- (id)description
{
  objc_super v3 = [(MTMaterialLayer *)self _effectiveDebugIdentifier];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    id v7 = [NSString stringWithFormat:@" (%@)", v3];
    id v8 = [v4 stringWithFormat:@"<%@%@: %p>", v6, v7, self];
  }
  else
  {
    id v8 = [v4 stringWithFormat:@"<%@%@: %p>", v5, &stru_1F069FDC0, self];
  }

  return v8;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (BOOL)isReduceMotionEnabled
{
  return self->_reduceMotionEnabled;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
}

- (id)defaultBackdropScaleAdjustment
{
  return self->_defaultBackdropScaleAdjustment;
}

+ (NSSet)mt_animatableKeys
{
  if (mt_animatableKeys_onceToken != -1) {
    dispatch_once(&mt_animatableKeys_onceToken, &__block_literal_global_159);
  }
  v2 = (void *)mt_animatableKeys___animatableKeyPaths;
  return (NSSet *)v2;
}

uint64_t __45__MTMaterialLayer_Private__mt_animatableKeys__block_invoke()
{
  mt_animatableKeys___animatableKeyPaths = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"recipe", @"recipeName", @"configuration", @"weighting", 0);
  return MEMORY[0x1F41817F8]();
}

void __55__MTMaterialLayer_Private__mt_implicitlyAnimatableKeys__block_invoke()
{
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v21 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A038]);
  uint64_t v16 = [v21 stringByAppendingFormat:@".%@", @"inputColorMatrix"];
  uint64_t v20 = MTFilterKeyPathForFilter(@"opacityColorMatrix");
  uint64_t v14 = [v20 stringByAppendingFormat:@".%@", @"inputColorMatrix"];
  uint64_t v19 = MTFilterKeyPathForFilter(@"inoperativeColorMatrix");
  double v10 = [v19 stringByAppendingFormat:@".%@", @"inputColorMatrix"];
  uint64_t v17 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A268]);
  BOOL v12 = [v17 stringByAppendingFormat:@".%@", @"inputAmount"];
  v0 = (void *)*MEMORY[0x1E4F3A260];
  uint64_t v15 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A260]);
  v1 = [v15 stringByAppendingFormat:@".%@", @"inputAmount"];
  uint64_t v13 = MTFilterKeyPathForFilter(v0);
  v2 = [v13 stringByAppendingFormat:@".%@", @"inputValues"];
  int v11 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A0D0]);
  objc_super v3 = [v11 stringByAppendingFormat:@".%@", @"inputRadius"];
  id v4 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A048]);
  uint64_t v5 = [v4 stringByAppendingFormat:@".%@", @"inputAmount"];
  uint64_t v6 = MTFilterKeyPathForFilter((void *)*MEMORY[0x1E4F3A000]);
  id v7 = [v6 stringByAppendingFormat:@".%@", @"inputAmount"];
  uint64_t v8 = objc_msgSend(v18, "initWithObjects:", v16, v14, v10, v12, v1, v2, v3, v5, v7, @"zoom", 0);
  objc_super v9 = (void *)mt_implicitlyAnimatableKeys___animatableKeyPaths;
  mt_implicitlyAnimatableKeys___animatableKeyPaths = v8;
}

- (void)setRecipeName:(id)a3
{
}

- (id)backdropScaleAdjustment
{
  v2 = (void *)MEMORY[0x1B3E741F0](self->_backdropScaleAdjustment, a2);
  return v2;
}

- (id)blurRadiusTransformer
{
  return [(MTMaterialSettingsInterpolator *)self->_settingsInterpolator blurRadiusTransformer];
}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (BOOL)isContentReplacedWithSnapshot
{
  return self->_contentReplacedWithSnapshot;
}

- (BOOL)_hasInoperativeAppearance
{
  [(CABackdropLayer *)self mt_colorMatrixDrivenInoperativeOpacity];
  return v2 < 1.0;
}

- (void)_setHasInoperativeAppearance:(BOOL)a3 removingIfIdentity:(BOOL)a4
{
  double v4 = 0.6;
  if (!a3) {
    double v4 = 1.0;
  }
  [(CABackdropLayer *)self mt_setColorMatrixDrivenInoperativeOpacity:a4 removingIfIdentity:v4];
}

- (void)didChangeValueForKey:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1AE9D6000, v0, v1, "%{public}@: Did change value for key '%{public}@'");
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1AE9D6000, v0, v1, "%{public}@: Updated zoom: %{public}f", v2);
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1AE9D6000, v0, v1, "%{public}@: Updated color matrix color: %{public}@");
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1AE9D6000, v0, v1, "%{public}@: Updated brightness: %{public}f", v2);
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1AE9D6000, v0, v1, "%{public}@: Updated saturation: %{public}f", v2);
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1AE9D6000, v0, v1, "%{public}@: Updated curves values: %{public}@");
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.6()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1AE9D6000, v0, v1, "%{public}@: Updated luminance alpha: %{public}f", v2);
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.7()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_1AE9D6000, v0, v1, "%{public}@: Updated blur radius: %{public}f", v2);
}

- (void)_configureBackdropLayer:(uint64_t)a1 withSettingsInterpolator:(NSObject *)a2 preservingFiltersIfIdentity:.cold.8(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1AE9D6000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Reduced transparency enabled, so replacing blur with average color", (uint8_t *)&v2, 0xCu);
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1AE9D6000, v0, v1, "%{public}@: Updating with settings interpolator: %{public}@");
}

@end