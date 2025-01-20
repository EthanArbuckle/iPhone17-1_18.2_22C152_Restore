@interface MTMaterialView
+ (BOOL)_isWorkaroundRequiredForRecipe:(int64_t)a3;
+ (Class)layerClass;
+ (id)_deprecatedControlCenterMaterialWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6;
+ (id)_recipeNameForTraitCollection:(id)a3 withRecipeNamesByTraitCollection:(id)a4;
+ (id)materialViewWithRecipe:(int64_t)a3;
+ (id)materialViewWithRecipe:(int64_t)a3 compatibleWithTraitCollection:(id)a4;
+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4;
+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5;
+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6;
+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 compatibleWithTraitCollection:(id)a5;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6;
+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7;
+ (id)materialViewWithRecipeNamed:(id)a3;
+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 compatibleWithTraitCollection:(id)a4 bundle:(id)a5 configuration:(int64_t)a6 initialWeighting:(double)a7 scaleAdjustment:(id)a8;
+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8;
+ (id)materialViewWithVisualStyleFromRecipe:(int64_t)a3 category:(int64_t)a4 style:(int64_t)a5 options:(unint64_t)a6 initialWeighting:(double)a7 compatibleWithTraitCollection:(id)a8;
+ (id)newDefaultHighlightAnimator;
+ (id)staticMaterialViewWithRecipe:(int64_t)a3;
+ (void)initialize;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)addCompletionForCurrentAnimation:(id)a3 forMaterialLayer:(id)a4 reason:(id *)a5;
- (BOOL)hasInoperativeAppearance;
- (BOOL)ignoresScreenClip;
- (BOOL)isBlurEnabled;
- (BOOL)isCaptureOnly;
- (BOOL)isContentReplacedWithSnapshot;
- (BOOL)isHighlighted;
- (BOOL)isInPlaceFilteringEnabled;
- (BOOL)isManagingInterpolationForMaterialLayer:(id)a3;
- (BOOL)isManagingOpacityForMaterialLayer:(id)a3;
- (BOOL)isRecipeDynamic;
- (BOOL)isShadowed;
- (BOOL)isZoomEnabled;
- (BOOL)managesWeightingForMaterialLayer:(id)a3;
- (BOOL)shouldCrossfade;
- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
- (MTMaterialView)init;
- (NSString)debugIdentifier;
- (NSString)description;
- (NSString)groupName;
- (NSString)groupNameBase;
- (NSString)recipeName;
- (UIViewFloatAnimatableProperty)_backdropFloatAnimatableProperty;
- (double)weighting;
- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3;
- (id)_groupNameWithBase:(id)a3;
- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
- (id)_initWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7;
- (id)_initWithRecipeNamesByTraitCollection:(id)a3 bundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8;
- (id)_recipeNameForCurrentTraitCollection;
- (id)backdropScaleAdjustment;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newShadowView;
- (id)newShadowViewWithCaptureOnlyMaterialView:(BOOL)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)recipe;
- (unint64_t)_options;
- (void)_addObserver:(id)a3;
- (void)_invalidateAlphaTransformer;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_reduceMotionStatusDidChange;
- (void)_reduceTransparencyStatusDidChange;
- (void)_removeObserver:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setRecipeName:(id)a3 withWeighting:(double)a4;
- (void)_setupAlphaTransformer;
- (void)_setupOrInvalidateAlphaTransformer;
- (void)_updateGroupNameIfNecessary;
- (void)_updateRecipeNameIfNeeded;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prune;
- (void)setBackdropFloatAnimatableProperty:(id)a3;
- (void)setBackdropScaleAdjustment:(id)a3;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setGroupName:(id)a3;
- (void)setGroupNameBase:(id)a3;
- (void)setHasInoperativeAppearance:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIgnoresScreenClip:(BOOL)a3;
- (void)setInPlaceFilteringEnabled:(BOOL)a3;
- (void)setRecipe:(int64_t)a3;
- (void)setRecipeDynamic:(BOOL)a3;
- (void)setRecipeName:(id)a3;
- (void)setRecipeName:(id)a3 fromBundle:(id)a4;
- (void)setShadowed:(BOOL)a3;
- (void)setShouldCrossfade:(BOOL)a3;
- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3;
- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3;
- (void)setWeighting:(double)a3;
- (void)setZoomEnabled:(BOOL)a3;
@end

@implementation MTMaterialView

- (void)_setupOrInvalidateAlphaTransformer
{
  if (self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment)
  {
    if (UIAccessibilityIsReduceMotionEnabled() || UIAccessibilityIsReduceTransparencyEnabled())
    {
      [(MTMaterialView *)self _invalidateAlphaTransformer];
    }
    else
    {
      [(MTMaterialView *)self _setupAlphaTransformer];
    }
  }
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3
{
  if (self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment != a3)
  {
    self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment = a3;
    if (a3)
    {
      v4 = [(MTMaterialView *)self _materialLayer];
      [v4 setShouldCrossfade:0];

      [(MTMaterialView *)self _setupOrInvalidateAlphaTransformer];
    }
    else
    {
      [(MTMaterialView *)self _invalidateAlphaTransformer];
      id v5 = [(MTMaterialView *)self _materialLayer];
      [v5 _reevaluateDefaultShouldCrossfade];
    }
  }
}

+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  v15 = (void *)[objc_alloc((Class)a1) _initWithCoreMaterialRecipe:v14 fromBundle:v13 options:a5 initialWeighting:v12 scaleAdjustment:a6];

  return v15;
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)[objc_alloc((Class)a1) _initWithRecipeNamesByTraitCollection:v17 bundle:v16 options:a5 initialWeighting:v15 scaleAdjustment:v14 compatibleWithTraitCollection:a6];

  return v18;
}

- (void)dealloc
{
  if (self->_reduceTransparencyObserverToken)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 _removeObserver:self->_reduceTransparencyObserverToken];

    self->_reduceTransparencyObserverToken = 0;
  }
  if (self->_reduceMotionObserverToken)
  {
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 _removeObserver:self->_reduceMotionObserverToken];

    self->_reduceMotionObserverToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  [(MTMaterialView *)&v5 dealloc];
}

- (void)setGroupNameBase:(id)a3
{
  id v6 = a3;
  if (([v6 isEqualToString:self->_groupNameBase] & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    groupNameBase = self->_groupNameBase;
    self->_groupNameBase = v4;

    if (self->_groupNameBase) {
      [(MTMaterialView *)self _updateGroupNameIfNecessary];
    }
    else {
      [(MTMaterialView *)self setGroupName:0];
    }
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_highlightView _setContinuousCornerRadius:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeNamesByTraitCollection, 0);

  objc_storeStrong((id *)&self->_cmVisualStyleCategoriesToProviders, 0);
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTMaterialView *)self _materialLayer];
  [v4 setContentReplacedWithSnapshot:v3];
}

- (void)_setupAlphaTransformer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2156C1000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Instantiating backdrop float animatable property", (uint8_t *)&v2, 0xCu);
}

void __40__MTMaterialView__setupAlphaTransformer__block_invoke_2_74(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _backdropFloatAnimatableProperty];

    if (v4)
    {
      objc_super v5 = [v3 _backdropFloatAnimatableProperty];
      [v5 presentationValue];
      double v7 = v6;

      v8 = [v3 _backdropFloatAnimatableProperty];
      v9 = objc_msgSend(MEMORY[0x263F15758], "mt_keyPathForColorMatrixDrivenOpacity");
      if (v8 && ([v8 value], BSFloatEqualToFloat()))
      {
        [v3 stopSettingPresentationValueForKey:v9];
      }
      else
      {
        double v10 = (*(double (**)(double))(*(void *)(a1 + 32) + 16))(v7);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v14 = 0u;
        objc_msgSend(MEMORY[0x263F15758], "mt_colorMatrixForOpacity:", v10);
        v13[2] = v16;
        v13[3] = v17;
        v13[4] = v18;
        v13[0] = v14;
        v13[1] = v15;
        v11 = [MEMORY[0x263F08D40] valueWithBytes:v13 objCType:"{CAColorMatrix=ffffffffffffffffffff}"];
        [v3 _setPresentationValue:v11 forKey:v9];

        id v12 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v20 = v3;
          __int16 v21 = 2050;
          double v22 = v7;
          __int16 v23 = 2050;
          double v24 = v10;
          _os_log_debug_impl(&dword_2156C1000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Updating presentation value for progress: %{public}f; alpha: %{public}f",
            buf,
            0x20u);
        }
      }
    }
  }
}

void __40__MTMaterialView__setupAlphaTransformer__block_invoke_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    uint64_t v3 = [WeakRetained _backdropFloatAnimatableProperty];

    id WeakRetained = v9;
    if (v3)
    {
      uint64_t v4 = [v9 _backdropFloatAnimatableProperty];
      [v4 value];
      double v6 = v5;

      double v7 = (*(double (**)(double))(*(void *)(a1 + 32) + 16))(v6);
      v8 = [v9 _materialLayer];
      [v8 _setPrivateOpacity:0 removingIfIdentity:v7];

      id WeakRetained = v9;
    }
  }
}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke_3(double a1)
{
  double result = 1.0;
  if (a1 < 0.05) {
    return fmin(fmax(a1 / 0.05 + 0.0, 0.0), 1.0);
  }
  return result;
}

- (id)_initWithRecipeNamesByTraitCollection:(id)a3 bundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  v20 = v19;
  if (v16)
  {
    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"MTMaterialView.m", 89, @"Invalid parameter not satisfying: %@", @"recipeNamesByTraitCollection" object file lineNumber description];

  if (!v20)
  {
LABEL_3:
    v20 = [MEMORY[0x263F1CB00] currentTraitCollection];
  }
LABEL_4:
  __int16 v21 = [(id)objc_opt_class() _recipeNameForTraitCollection:v20 withRecipeNamesByTraitCollection:v16];
  double v22 = [(MTMaterialView *)self _initWithCoreMaterialRecipe:v21 fromBundle:v17 options:a5 initialWeighting:v18 scaleAdjustment:a6];
  __int16 v23 = v22;
  if (v22) {
    objc_storeStrong(v22 + 53, a3);
  }

  return v23;
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  [(MTMaterialView *)&v5 didMoveToWindow];
  uint64_t v3 = [(MTMaterialView *)self window];
  if (v3)
  {
    BOOL needsLayoutOnMoveToWindow = self->_needsLayoutOnMoveToWindow;

    if (needsLayoutOnMoveToWindow)
    {
      [(MTMaterialView *)self setNeedsLayout];
      self->_BOOL needsLayoutOnMoveToWindow = 0;
    }
  }
}

- (id)_recipeNameForCurrentTraitCollection
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(MTMaterialView *)self traitCollection];
  objc_super v5 = [v3 _recipeNameForTraitCollection:v4 withRecipeNamesByTraitCollection:self->_recipeNamesByTraitCollection];

  return v5;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MTMaterialView;
  [(MTMaterialView *)&v7 layoutSubviews];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__MTMaterialView_layoutSubviews__block_invoke;
  v6[3] = &unk_2642569C0;
  v6[4] = self;
  uint64_t v3 = (void (**)(void))MEMORY[0x2166C1FA0](v6);
  uint64_t v4 = [(MTMaterialView *)self traitCollection];
  uint64_t v5 = [v4 valueForNSIntegerTrait:objc_opt_class()];

  if (v5 == 1) {
    [MEMORY[0x263F1CB60] performWithoutAnimation:v3];
  }
  else {
    v3[2](v3);
  }
}

void __32__MTMaterialView_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateRecipeNameIfNeeded];
  int v2 = [*(id *)(a1 + 32) window];

  if (!v2) {
    *(unsigned char *)(*(void *)(a1 + 32) + 456) = 1;
  }
}

- (void)_updateRecipeNameIfNeeded
{
  int64_t recipe = self->_recipe;
  if (recipe)
  {
    if (self->_recipeDynamic)
    {
      uint64_t v4 = [(MTMaterialView *)self traitCollection];
      uint64_t v5 = [v4 userInterfaceStyle];

      int64_t recipe = self->_recipe;
    }
    else
    {
      uint64_t v5 = 0;
    }
    double v6 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(recipe, v5, self->_shadowed);
    if (!v6) {
      goto LABEL_13;
    }
LABEL_9:
    double v10 = v6;
    objc_super v7 = [(MTMaterialView *)self _materialLayer];
    v8 = [v7 recipeName];
    char v9 = [v8 isEqualToString:v10];

    if ((v9 & 1) == 0) {
      [(MTMaterialView *)self setRecipeName:v10];
    }
    double v6 = v10;
    goto LABEL_13;
  }
  if (!self->_recipeNamesByTraitCollection)
  {
    double v6 = 0;
    goto LABEL_13;
  }
  double v6 = [(MTMaterialView *)self _recipeNameForCurrentTraitCollection];
  if (v6) {
    goto LABEL_9;
  }
LABEL_13:
}

+ (id)_recipeNameForTraitCollection:(id)a3 withRecipeNamesByTraitCollection:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  objc_super v7 = 0;
  if (a3 && v5)
  {
    id v8 = a3;
    char v9 = [v6 allKeys];
    double v10 = (void *)MEMORY[0x263F1CB00];
    uint64_t v11 = [v8 userInterfaceStyle];

    id v12 = [v10 traitCollectionWithUserInterfaceStyle:v11];
    id v13 = [v9 arrayByAddingObject:v12];

    long long v14 = [MEMORY[0x263F1CB00] traitCollectionWithTraitsFromCollections:v13];
    if (v14)
    {
      objc_super v7 = [v6 objectForKey:v14];
    }
    else
    {
      objc_super v7 = 0;
    }
  }

  return v7;
}

- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = [(MTMaterialView *)self init];
  if (v16)
  {
    if (!v13)
    {
      double v24 = [MEMORY[0x263F08690] currentHandler];
      [v24 handleFailureInMethod:a2, v16, @"MTMaterialView.m", 775, @"Invalid parameter not satisfying: %@", @"cmRecipe" object file lineNumber description];
    }
    objc_storeStrong((id *)&v16->_recipeBundle, a4);
    [(MTMaterialView *)v16 setUserInteractionEnabled:0];
    [(MTMaterialView *)v16 setBackdropScaleAdjustment:v15];
    id v17 = [(MTMaterialView *)v16 _materialLayer];
    [v17 setReduceTransparencyEnabled:UIAccessibilityIsReduceTransparencyEnabled()];

    id v18 = [(MTMaterialView *)v16 _materialLayer];
    [v18 setReduceMotionEnabled:UIAccessibilityIsReduceMotionEnabled()];

    id v19 = [(MTMaterialView *)v16 _materialLayer];
    [v19 setRecipeName:v13 fromBundle:v14];

    [(MTMaterialView *)v16 setBlurEnabled:(a5 & 1) == 0];
    [(MTMaterialView *)v16 setZoomEnabled:(a5 & 2) == 0];
    [(MTMaterialView *)v16 setCaptureOnly:(a5 >> 2) & 1];
    [(MTMaterialView *)v16 setShadowed:(a5 >> 3) & 1];
    [(MTMaterialView *)v16 setWeighting:a6];
    if (fabs(a6) < 2.22044605e-16)
    {
      v20 = [(MTMaterialView *)v16 _materialLayer];
      [v20 _setNeedsConfiguring];

      [(MTMaterialView *)v16 setNeedsLayout];
      [(MTMaterialView *)v16 layoutIfNeeded];
    }
    __int16 v21 = [MEMORY[0x263F08A00] defaultCenter];
    v16->_reduceTransparencyObserverToken = [v21 _addObserver:v16 selector:sel__reduceTransparencyStatusDidChange name:*MEMORY[0x263F1CE58] object:0 options:0];

    double v22 = [MEMORY[0x263F08A00] defaultCenter];
    v16->_reduceMotionObserverToken = [v22 _addObserver:v16 selector:sel__reduceMotionStatusDidChange name:*MEMORY[0x263F1CE50] object:0 options:0];
  }
  return v16;
}

- (void)_updateGroupNameIfNecessary
{
  if (self->_groupNameBase)
  {
    -[MTMaterialView _groupNameWithBase:](self, "_groupNameWithBase:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [(MTMaterialView *)self setGroupName:v3];
  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  [v5 setBlurEnabled:v3];

  [(MTMaterialView *)self _updateGroupNameIfNecessary];
}

- (void)setGroupName:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  [v5 setGroupName:v4];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __31__MTMaterialView_setGroupName___block_invoke;
  v6[3] = &unk_264256A68;
  v6[4] = self;
  [(MTMaterialView *)self _notifyObserversWithBlock:v6];
}

- (id)_groupNameWithBase:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089D8];
  id v5 = a3;
  id v6 = [v4 alloc];
  objc_super v7 = [(MTMaterialView *)self _materialLayer];
  id v8 = [v7 recipeName];
  char v9 = (void *)[v6 initWithFormat:@"%@.%@", v5, v8];

  if (![(MTMaterialView *)self isBlurEnabled]) {
    [v9 appendString:@".noBlur"];
  }
  if (![(MTMaterialView *)self isZoomEnabled]) {
    [v9 appendString:@".noZoom"];
  }
  if ([(MTMaterialView *)self isShadowed]) {
    [v9 appendString:@".shadowed"];
  }
  double v10 = [(MTMaterialView *)self _materialLayer];
  int v11 = [v10 reducesCaptureBitDepth];

  if (v11) {
    [v9 appendString:@".reducesCaptureBitDepth"];
  }

  return v9;
}

- (void)setWeighting:(double)a3
{
  double v4 = fmax(fmin(a3, 1.0), 0.0);
  [(MTMaterialView *)self weighting];
  if (v4 != v5)
  {
    id v6 = [(MTMaterialView *)self _materialLayer];
    [v6 setWeighting:v4];

    objc_super v7 = [(MTMaterialView *)self _backdropFloatAnimatableProperty];
    [v7 setValue:v4];

    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__MTMaterialView_setWeighting___block_invoke;
    v8[3] = &unk_264256A68;
    v8[4] = self;
    [(MTMaterialView *)self _notifyObserversWithBlock:v8];
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  double v5 = [(MTMaterialView *)self _materialLayer];
  id v6 = objc_msgSend((id)objc_opt_class(), "mt_implicitlyAnimatableKeys");
  if ([v6 containsObject:v4])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTMaterialView;
    BOOL v7 = [(MTMaterialView *)&v9 _shouldAnimatePropertyWithKey:v4];
  }

  return v7;
}

- (double)weighting
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  [v2 weighting];
  double v4 = v3;

  return v4;
}

- (UIViewFloatAnimatableProperty)_backdropFloatAnimatableProperty
{
  return self->_backdropFloatAnimatableProperty;
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v4 = (void (**)(id, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v6 = observers;
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

- (BOOL)isZoomEnabled
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 isZoomEnabled];

  return v3;
}

- (BOOL)isShadowed
{
  return self->_shadowed;
}

- (BOOL)isBlurEnabled
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 isBlurEnabled];

  return v3;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  [v5 setBackdropScaleAdjustment:v4];
}

- (void)setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  [v5 setZoomEnabled:v3];

  [(MTMaterialView *)self _updateGroupNameIfNecessary];
}

- (void)setShadowed:(BOOL)a3
{
  if (self->_shadowed != a3)
  {
    self->_shadowed = a3;
    int64_t recipe = self->_recipe;
    if (recipe)
    {
      if (self->_recipeDynamic)
      {
        id v5 = [(MTMaterialView *)self traitCollection];
        uint64_t v6 = [v5 userInterfaceStyle];

        int64_t recipe = self->_recipe;
        *(_DWORD *)&a3 = self->_shadowed;
      }
      else
      {
        uint64_t v6 = 0;
      }
      MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(recipe, v6, a3);
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      [(MTMaterialView *)self setRecipeName:v7];
    }
  }
}

- (void)setCaptureOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTMaterialView *)self _materialLayer];
  [v4 setCaptureOnly:v3];
}

- (MTMaterialView)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTMaterialView;
  double result = [(MTMaterialView *)&v3 init];
  if (result) {
    result->_recipeDynamic = 1;
  }
  return result;
}

- (BOOL)isManagingOpacityForMaterialLayer:(id)a3
{
  return self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView _setCornerRadius:](&v5, sel__setCornerRadius_);
  [(UIView *)self->_highlightView _setCornerRadius:a3];
}

- (BOOL)managesWeightingForMaterialLayer:(id)a3
{
  return 1;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke_78(double a1, double a2, double a3)
{
  if (a3 < 15.0 && a2 == 0.0) {
    a2 = a3 / 10.0;
  }
  return a1 * a3 + (1.0 - a1) * a2;
}

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    MTRegisterMaterialKitLogging();
  }
}

- (id)_initWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  if (!v13)
  {
    id v13 = [MEMORY[0x263F1CB00] currentTraitCollection];
  }
  long long v14 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, [v13 userInterfaceStyle]);
  id v15 = [(MTMaterialView *)self _initWithCoreMaterialRecipe:v14 fromBundle:0 options:a4 initialWeighting:v12 scaleAdjustment:a5];

  if (v15) {
    v15[62] = a3;
  }

  return v15;
}

+ (id)materialViewWithRecipe:(int64_t)a3
{
  return (id)[a1 materialViewWithRecipe:a3 options:0];
}

+ (id)materialViewWithRecipe:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)[a1 materialViewWithRecipe:a3 options:0 compatibleWithTraitCollection:a4];
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4
{
  return (id)[a1 materialViewWithRecipe:a3 options:a4 initialWeighting:1.0];
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 compatibleWithTraitCollection:(id)a5
{
  return (id)[a1 materialViewWithRecipe:a3 options:a4 initialWeighting:a5 compatibleWithTraitCollection:1.0];
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5
{
  uint64_t v9 = [MEMORY[0x263F1CB00] currentTraitCollection];
  uint64_t v10 = [a1 materialViewWithRecipe:a3 options:a4 initialWeighting:v9 compatibleWithTraitCollection:a5];

  return v10;
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v10 = a6;
  long long v11 = (void *)[objc_alloc((Class)a1) _initWithRecipe:a3 options:a4 initialWeighting:0 scaleAdjustment:v10 compatibleWithTraitCollection:a5];

  return v11;
}

+ (id)newDefaultHighlightAnimator
{
  id v2 = objc_alloc(MEMORY[0x263F1CB78]);
  id v3 = objc_alloc_init(MEMORY[0x263F1C5A0]);
  id v4 = (void *)[v2 initWithDuration:v3 timingParameters:0.2];

  return v4;
}

- (NSString)groupName
{
  id v2 = [(MTMaterialView *)self _materialLayer];
  id v3 = [v2 groupName];

  return (NSString *)v3;
}

void __31__MTMaterialView_setGroupName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 groupNameDidChangeForMaterialView:*(void *)(a1 + 32)];
  }
}

void __31__MTMaterialView_setWeighting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 weightingDidChangeForMaterialView:*(void *)(a1 + 32)];
  }
}

- (void)setRecipe:(int64_t)a3
{
  if (self->_recipe != a3)
  {
    self->_int64_t recipe = a3;
    if (self->_recipeDynamic)
    {
      objc_super v5 = [(MTMaterialView *)self traitCollection];
      uint64_t v6 = [v5 userInterfaceStyle];
    }
    else
    {
      uint64_t v6 = 0;
    }
    MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a3, v6, self->_shadowed);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(MTMaterialView *)self setRecipeName:v7];
  }
}

- (BOOL)isCaptureOnly
{
  id v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 captureOnly];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      id v5 = objc_alloc(MEMORY[0x263F1CB60]);
      [(MTMaterialView *)self bounds];
      uint64_t v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      id v7 = self->_highlightView;
      self->_highlightView = v6;

      [(UIView *)self->_highlightView setUserInteractionEnabled:0];
      [(UIView *)self->_highlightView setAutoresizingMask:18];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __33__MTMaterialView_setHighlighted___block_invoke;
      v9[3] = &unk_2642569C0;
      v9[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v9];
      highlightView = self->_highlightView;
      *(_DWORD *)&a3 = self->_highlighted;
    }
    double v8 = 1.0;
    if (!a3) {
      double v8 = 0.0;
    }
    [(UIView *)highlightView setAlpha:v8];
  }
}

void __33__MTMaterialView_setHighlighted___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) layer];
  [v6 cornerRadius];
  if (v2 > 0.0)
  {
    char v3 = [*(id *)(*(void *)(a1 + 32) + 448) layer];
    [v6 cornerRadius];
    objc_msgSend(v3, "setCornerRadius:");
    id v4 = [v6 cornerCurve];
    [v3 setCornerCurve:v4];
  }
  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 448)];
  id v5 = [*(id *)(a1 + 32) visualStylingProviderForCategory:2];
  [v5 automaticallyUpdateView:*(void *)(*(void *)(a1 + 32) + 448) withStyle:4 andObserverBlock:&__block_literal_global_4];

  [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:0.0];
}

id __33__MTMaterialView_setHighlighted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__MTMaterialView_setHighlighted___block_invoke_3;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  id v4 = (void *)MEMORY[0x2166C1FA0](v6);

  return v4;
}

uint64_t __33__MTMaterialView_setHighlighted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (BOOL)hasInoperativeAppearance
{
  double v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 _hasInoperativeAppearance];

  return v3;
}

- (void)setHasInoperativeAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTMaterialView *)self _materialLayer];
  [v4 _setHasInoperativeAppearance:v3 removingIfIdentity:0];
}

- (NSString)debugIdentifier
{
  double v2 = [(MTMaterialView *)self _materialLayer];
  BOOL v3 = [v2 debugIdentifier];

  return (NSString *)v3;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  [v5 setDebugIdentifier:v4];
}

- (void)prune
{
  id v2 = [(MTMaterialView *)self _materialLayer];
  [v2 prune];
}

- (BOOL)isManagingInterpolationForMaterialLayer:(id)a3
{
  int v3 = objc_msgSend(MEMORY[0x263F1CB60], "_isInRetargetableAnimationBlock", a3);
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F1CB60];
    LOBYTE(v3) = [v4 areAnimationsEnabled];
  }
  return v3;
}

- (BOOL)addCompletionForCurrentAnimation:(id)a3 forMaterialLayer:(id)a4 reason:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    if (a5)
    {
      id v12 = @"no argument block";
LABEL_13:
      BOOL v11 = 0;
      *a5 = v12;
      goto LABEL_15;
    }
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  if (![MEMORY[0x263F1CB60] _isInAnimationBlockWithAnimationsEnabled])
  {
    if (a5)
    {
      if ([MEMORY[0x263F1CB60] _isInAnimationBlock]) {
        id v12 = @"animations disabled";
      }
      else {
        id v12 = @"no animation";
      }
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  uint64_t v9 = (void *)MEMORY[0x263F1CB60];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__MTMaterialView_addCompletionForCurrentAnimation_forMaterialLayer_reason___block_invoke;
  v14[3] = &unk_264256A90;
  id v15 = v7;
  char v10 = [v9 _addCompletion:v14];
  BOOL v11 = v10;
  if (a5 && (v10 & 1) == 0) {
    *a5 = @"failed to add completion";
  }

LABEL_15:
  return v11;
}

uint64_t __75__MTMaterialView_addCompletionForCurrentAnimation_forMaterialLayer_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  id v4 = MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a3);
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_cmVisualStyleCategoriesToProviders objectForKey:v4];
    if (!v5)
    {
      if (!self->_cmVisualStyleCategoriesToProviders)
      {
        id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        cmVisualStyleCategoriesToProviders = self->_cmVisualStyleCategoriesToProviders;
        self->_cmVisualStyleCategoriesToProviders = v6;
      }
      [(MTMaterialView *)self _updateRecipeNameIfNeeded];
      id v8 = [(MTMaterialView *)self _coreMaterialVisualStylingProviderForCategory:v4];
      uint64_t v9 = [v8 visualStyleSetName];
      uint64_t v10 = [v9 length];

      if (v10)
      {
        id v5 = [[MTVisualStylingProvider alloc] initWithCoreMaterialVisualStylingProvider:v8];
        [(NSMutableDictionary *)self->_cmVisualStyleCategoriesToProviders setObject:v5 forKey:v4];
      }
      else
      {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

uint64_t __40__MTMaterialView__setupAlphaTransformer__block_invoke_2(uint64_t a1)
{
  return MEMORY[0x270F1A7D8](*(void *)(a1 + 32));
}

- (void)_invalidateAlphaTransformer
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2156C1000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Tearing down backdrop float animatable property", (uint8_t *)&v2, 0xCu);
}

- (void)_setRecipeName:(id)a3 withWeighting:(double)a4
{
  id v6 = a3;
  id v7 = [(MTMaterialView *)self _materialLayer];
  [v7 setRecipeName:v6 fromBundle:self->_recipeBundle];

  id v8 = [(MTMaterialView *)self _materialLayer];
  [v8 setWeighting:a4];

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__MTMaterialView__setRecipeName_withWeighting___block_invoke;
  v9[3] = &unk_264256A68;
  v9[4] = self;
  [(MTMaterialView *)self _notifyObserversWithBlock:v9];
  [(MTMaterialView *)self _updateGroupNameIfNecessary];
}

void __47__MTMaterialView__setRecipeName_withWeighting___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 recipeNameDidChangeForMaterialView:*(void *)(a1 + 32)];
  }
}

- (void)_reduceMotionStatusDidChange
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  uint64_t v4 = [(MTMaterialView *)self _materialLayer];
  int v5 = [v4 isReduceMotionEnabled];

  if (IsReduceMotionEnabled != v5)
  {
    id v6 = [(MTMaterialView *)self _materialLayer];
    [v6 setReduceMotionEnabled:IsReduceMotionEnabled];

    [(MTMaterialView *)self _setupOrInvalidateAlphaTransformer];
  }
}

- (void)_reduceTransparencyStatusDidChange
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  uint64_t v4 = [(MTMaterialView *)self _materialLayer];
  int v5 = [v4 isReduceTransparencyEnabled];

  if (IsReduceTransparencyEnabled != v5)
  {
    id v6 = [(MTMaterialView *)self _materialLayer];
    [v6 setReduceTransparencyEnabled:IsReduceTransparencyEnabled];

    [(MTMaterialView *)self _setupOrInvalidateAlphaTransformer];
  }
}

- (NSString)description
{
  id v3 = [(MTMaterialView *)self debugIdentifier];
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    id v7 = [NSString stringWithFormat:@" (%@)", v3];
    id v8 = [v4 stringWithFormat:@"<%@%@: %p>", v6, v7, self];
  }
  else
  {
    id v8 = [v4 stringWithFormat:@"<%@%@: %p>", v5, &stru_26C644178, self];
  }

  return (NSString *)v8;
}

- (NSString)groupNameBase
{
  return self->_groupNameBase;
}

- (int64_t)recipe
{
  return self->_recipe;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setBackdropFloatAnimatableProperty:(id)a3
{
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263F1CB00];
  id v11 = a6;
  id v12 = [v10 currentTraitCollection];
  id v13 = [a1 materialViewWithRecipe:a3 options:a4 initialWeighting:v11 scaleAdjustment:v12 compatibleWithTraitCollection:a5];

  return v13;
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  long long v14 = (void *)[objc_alloc((Class)a1) _initWithRecipe:a3 options:a4 initialWeighting:v13 scaleAdjustment:v12 compatibleWithTraitCollection:a5];

  return v14;
}

+ (id)materialViewWithRecipeNamed:(id)a3
{
  return (id)[a1 materialViewWithRecipeNamed:a3 inBundle:0 options:0 initialWeighting:0 scaleAdjustment:1.0];
}

+ (id)materialViewWithVisualStyleFromRecipe:(int64_t)a3 category:(int64_t)a4 style:(int64_t)a5 options:(unint64_t)a6 initialWeighting:(double)a7 compatibleWithTraitCollection:(id)a8
{
  id v13 = a8;
  long long v14 = MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
  id v15 = MTCoreMaterialVisualStyleForVisualStyle(a5);
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __135__MTMaterialView_Private__materialViewWithVisualStyleFromRecipe_category_style_options_initialWeighting_compatibleWithTraitCollection___block_invoke;
  v28[3] = &unk_264256B40;
  int64_t v31 = a3;
  id v16 = v14;
  id v29 = v16;
  id v17 = v15;
  id v30 = v17;
  id v18 = (void (**)(void, void))MEMORY[0x2166C1FA0](v28);
  id v19 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  v20 = v18[2](v18, 1);
  if (v20)
  {
    __int16 v21 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
    [v19 setObject:v20 forKey:v21];

    double v22 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    [v19 setObject:v20 forKey:v22];
  }
  __int16 v23 = v18[2](v18, 2);
  if (v23)
  {
    double v24 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    [v19 setObject:v23 forKey:v24];
  }
  uint64_t v25 = (void *)[objc_alloc((Class)a1) _initWithRecipeNamesByTraitCollection:v19 bundle:0 options:a6 initialWeighting:0 scaleAdjustment:v13 compatibleWithTraitCollection:a7];

  return v25;
}

id __135__MTMaterialView_Private__materialViewWithVisualStyleFromRecipe_category_style_options_initialWeighting_compatibleWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(*(void *)(a1 + 48), a2);
  id v3 = MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle();

  return v3;
}

- (NSString)recipeName
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  id v3 = [v2 recipeName];

  return (NSString *)v3;
}

- (void)setRecipeName:(id)a3
{
}

- (void)setRecipeName:(id)a3 fromBundle:(id)a4
{
  uint64_t v6 = (NSBundle *)a4;
  if (a3 && v6) {
    self->_int64_t recipe = 0;
  }
  recipeBundle = self->_recipeBundle;
  self->_recipeBundle = v6;
  id v8 = a3;

  [(MTMaterialView *)self _setRecipeName:v8 withWeighting:1.0];
}

- (BOOL)isInPlaceFilteringEnabled
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 allowsInPlaceFiltering];

  return v3;
}

- (void)setInPlaceFilteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTMaterialView *)self _materialLayer];
  [v4 setAllowsInPlaceFiltering:v3];
}

- (id)backdropScaleAdjustment
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  BOOL v3 = [v2 backdropScaleAdjustment];

  return v3;
}

- (BOOL)shouldCrossfade
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 shouldCrossfade];

  return v3;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTMaterialView *)self shouldCrossfade] != a3)
  {
    if (v3) {
      [(MTMaterialView *)self setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:0];
    }
    id v5 = [(MTMaterialView *)self _materialLayer];
    [v5 setShouldCrossfade:v3];
  }
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment
{
  return self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 || MTDynamicBlurRadiusGraphicsQuality() != 100)
  {
    [(MTMaterialView *)self setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:v3];
  }
}

- (BOOL)isRecipeDynamic
{
  return self->_recipeDynamic;
}

- (void)setRecipeDynamic:(BOOL)a3
{
  if (self->_recipeDynamic != a3)
  {
    self->_recipeDynamic = a3;
    [(MTMaterialView *)self setNeedsLayout];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __44__MTMaterialView_Private__setRecipeDynamic___block_invoke;
    v4[3] = &unk_2642569C0;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:1.0];
  }
}

uint64_t __44__MTMaterialView_Private__setRecipeDynamic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (BOOL)ignoresScreenClip
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 ignoresScreenClip];

  return v3;
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTMaterialView *)self _materialLayer];
  [v4 setIgnoresScreenClip:v3];
}

- (unint64_t)_options
{
  unint64_t v3 = [(MTMaterialView *)self isBlurEnabled] ^ 1;
  if (![(MTMaterialView *)self isZoomEnabled]) {
    v3 |= 2uLL;
  }
  if ([(MTMaterialView *)self isCaptureOnly]) {
    v3 |= 4uLL;
  }
  if ([(MTMaterialView *)self isShadowed]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  if (self->_recipeNamesByTraitCollection)
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    recipeNamesByTraitCollection = self->_recipeNamesByTraitCollection;
    recipeBundle = self->_recipeBundle;
    unint64_t v8 = [(MTMaterialView *)self _options];
    [(MTMaterialView *)self weighting];
    double v10 = v9;
    id v11 = [(MTMaterialView *)self backdropScaleAdjustment];
    id v12 = [(MTMaterialView *)self traitCollection];
    uint64_t v13 = [v5 _initWithRecipeNamesByTraitCollection:recipeNamesByTraitCollection bundle:recipeBundle options:v8 initialWeighting:v11 scaleAdjustment:v12 compatibleWithTraitCollection:v10];
LABEL_5:
    v20 = (void *)v13;
    goto LABEL_6;
  }
  int64_t recipe = self->_recipe;
  id v15 = objc_alloc((Class)objc_opt_class());
  if (recipe)
  {
    int64_t v16 = self->_recipe;
    unint64_t v17 = [(MTMaterialView *)self _options];
    [(MTMaterialView *)self weighting];
    double v19 = v18;
    id v11 = [(MTMaterialView *)self backdropScaleAdjustment];
    id v12 = [(MTMaterialView *)self traitCollection];
    uint64_t v13 = [v15 _initWithRecipe:v16 options:v17 initialWeighting:v11 scaleAdjustment:v12 compatibleWithTraitCollection:v19];
    goto LABEL_5;
  }
  id v11 = [(MTMaterialView *)self _materialLayer];
  id v12 = [v11 recipe];
  __int16 v23 = v12;
  if (!v12)
  {
    unint64_t v3 = [(MTMaterialView *)self _materialLayer];
    __int16 v23 = [v3 recipeName];
  }
  double v24 = self->_recipeBundle;
  unint64_t v25 = [(MTMaterialView *)self _options];
  [(MTMaterialView *)self weighting];
  double v27 = v26;
  v28 = [(MTMaterialView *)self backdropScaleAdjustment];
  v20 = (void *)[v15 _initWithCoreMaterialRecipe:v23 fromBundle:v24 options:v25 initialWeighting:v28 scaleAdjustment:v27];

  if (!v12)
  {
  }
LABEL_6:

  __int16 v21 = [(MTMaterialView *)self groupNameBase];
  [v20 setGroupNameBase:v21];

  objc_msgSend(v20, "setShouldCrossfade:", -[MTMaterialView shouldCrossfade](self, "shouldCrossfade"));
  objc_msgSend(v20, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", -[MTMaterialView useBuiltInAlphaTransformerAndBackdropScaleAdjustment](self, "useBuiltInAlphaTransformerAndBackdropScaleAdjustment"));
  objc_msgSend(v20, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", -[MTMaterialView useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary](self, "useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary"));
  objc_msgSend(v20, "setRecipeDynamic:", -[MTMaterialView isRecipeDynamic](self, "isRecipeDynamic"));
  objc_msgSend(v20, "setIgnoresScreenClip:", -[MTMaterialView ignoresScreenClip](self, "ignoresScreenClip"));
  return v20;
}

- (id)newShadowView
{
  return [(MTMaterialView *)self newShadowViewWithCaptureOnlyMaterialView:1];
}

- (id)newShadowViewWithCaptureOnlyMaterialView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [[MTMaterialShadowView alloc] initWithMaterialView:self];
  [(MTMaterialShadowView *)v4 setCaptureOnlyMaterialViewSuppliedByClient:!v3];
  return v4;
}

- (BOOL)isContentReplacedWithSnapshot
{
  int v2 = [(MTMaterialView *)self _materialLayer];
  char v3 = [v2 isContentReplacedWithSnapshot];

  return v3;
}

- (void)_addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      id v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      unint64_t v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSHashTable *)observers addObject:v9];
    id v5 = v9;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)_removeObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(MTMaterialView *)self _materialLayer];
  uint64_t v6 = [v5 visualStylingProviderForCategory:v4];

  return v6;
}

+ (id)staticMaterialViewWithRecipe:(int64_t)a3
{
  id v4 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, 0);
  if (v4 && [MEMORY[0x263F36790] canGenerateVisualStyleSetFromRecipe:v4])
  {
    id v5 = +[MTMaterialView materialViewWithRecipe:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (BOOL)_isWorkaroundRequiredForRecipe:(int64_t)a3
{
  return a3 == 4 || a3 == 8;
}

+ (id)_deprecatedControlCenterMaterialWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v11 = a6;
  if (([a1 _isWorkaroundRequiredForRecipe:a3] & 1) == 0)
  {
    double v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"MTMaterialView.m", 844, @"Invalid parameter not satisfying: %@", @"[self _isWorkaroundRequiredForRecipe:recipe]" object file lineNumber description];
  }
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __120__MTMaterialView_DEPRECATED___deprecatedControlCenterMaterialWithRecipe_configuration_initialWeighting_scaleAdjustment___block_invoke;
  v19[3] = &__block_descriptor_40_e44____MTStaticVisualStylingMaterialView_16__0q8l;
  v19[4] = a3;
  uint64_t v12 = MEMORY[0x2166C1FA0](v19);
  uint64_t v13 = (void *)v12;
  switch(a4)
  {
    case 0:
    case 2:
      goto LABEL_7;
    case 1:
      if (a3 == 4) {
        a3 = 20;
      }
      else {
        a3 = 21;
      }
LABEL_7:
      uint64_t v14 = [a1 materialViewWithRecipe:a3 options:0 initialWeighting:v11 scaleAdjustment:a5];
      goto LABEL_12;
    case 3:
      int64_t v16 = *(void (**)(void))(v12 + 16);
      goto LABEL_11;
    case 4:
      int64_t v16 = *(void (**)(void))(v12 + 16);
LABEL_11:
      uint64_t v14 = v16();
LABEL_12:
      id v15 = (void *)v14;
      break;
    default:
      id v15 = 0;
      break;
  }

  return v15;
}

id __120__MTMaterialView_DEPRECATED___deprecatedControlCenterMaterialWithRecipe_configuration_initialWeighting_scaleAdjustment___block_invoke(uint64_t a1, uint64_t a2)
{
  char v3 = +[MTVisualStylingProvider _visualStylingProviderForRecipe:*(void *)(a1 + 32) andCategory:2];
  id v4 = MTCoreMaterialVisualStyleForVisualStyle(a2);
  id v5 = [v3 _coreMaterialVisualStylingProvider];
  uint64_t v6 = [v5 visualStyleSetName];
  id v7 = MTCoreMaterialRecipeForVisualStyleFromStyleWithName();

  unint64_t v8 = +[MTMaterialView materialViewWithRecipeNamed:v7];
  id v9 = +[MTVisualStylingProvider _visualStylingProviderForRecipe:4 andCategory:1];
  [v8 setVisualStylingProvider:v9 forCategory:1];

  double v10 = +[MTVisualStylingProvider _visualStylingProviderForRecipe:4 andCategory:2];
  [v8 setVisualStylingProvider:v10 forCategory:2];

  return v8;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4
{
  if (objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:")) {
    [a1 _deprecatedControlCenterMaterialWithRecipe:a3 configuration:a4 initialWeighting:0 scaleAdjustment:1.0];
  }
  else {
  id v7 = [a1 materialViewWithRecipe:a3];
  }

  return v7;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5
{
  if (objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:")) {
    [a1 _deprecatedControlCenterMaterialWithRecipe:a3 configuration:a4 initialWeighting:0 scaleAdjustment:a5];
  }
  else {
  id v9 = [a1 materialViewWithRecipe:a3 options:0 initialWeighting:a5];
  }

  return v9;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v10 = a6;
  if ([a1 _isWorkaroundRequiredForRecipe:a3]) {
    [a1 _deprecatedControlCenterMaterialWithRecipe:a3 configuration:a4 initialWeighting:0 scaleAdjustment:a5];
  }
  else {
  id v11 = [a1 materialViewWithRecipe:a3 options:0 initialWeighting:v10 compatibleWithTraitCollection:a5];
  }

  return v11;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v10 = a6;
  if ([a1 _isWorkaroundRequiredForRecipe:a3]) {
    [a1 _deprecatedControlCenterMaterialWithRecipe:a3 configuration:a4 initialWeighting:v10 scaleAdjustment:a5];
  }
  else {
  id v11 = [a1 materialViewWithRecipe:a3 options:0 initialWeighting:v10 scaleAdjustment:a5];
  }

  return v11;
}

+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  return (id)[a1 materialViewWithRecipeNamed:a3 inBundle:a4 options:0 initialWeighting:a7 scaleAdjustment:a6];
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 compatibleWithTraitCollection:(id)a4 bundle:(id)a5 configuration:(int64_t)a6 initialWeighting:(double)a7 scaleAdjustment:(id)a8
{
  return (id)[a1 materialViewWithRecipeNamesByTraitCollection:a3 inBundle:a5 options:0 initialWeighting:a8 scaleAdjustment:a4 compatibleWithTraitCollection:a7];
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v11 = (void *)MEMORY[0x263F1CB00];
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v11 currentTraitCollection];
  int64_t v16 = [a1 materialViewWithRecipeNamesByTraitCollection:v14 inBundle:v13 options:0 initialWeighting:v12 scaleAdjustment:v15 compatibleWithTraitCollection:a6];

  return v16;
}

@end