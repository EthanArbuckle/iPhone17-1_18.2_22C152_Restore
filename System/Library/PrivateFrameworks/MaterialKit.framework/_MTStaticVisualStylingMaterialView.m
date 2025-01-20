@interface _MTStaticVisualStylingMaterialView
+ (Class)layerClass;
- (BOOL)ignoresScreenClip;
- (BOOL)isBlurEnabled;
- (BOOL)isCaptureOnly;
- (BOOL)isContentReplacedWithSnapshot;
- (BOOL)isZoomEnabled;
- (BOOL)shouldCrossfade;
- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary;
- (NSArray)requiredVisualStyleCategories;
- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3;
- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7;
- (id)_materialLayer;
- (id)backdropScaleAdjustment;
- (id)recipeName;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_invalidateContentVisualStyling;
- (void)_setCoreMaterialVisualStylingProvider:(id)a3 ForCategory:(id)a4;
- (void)_updateContentVisualStylingIfNecessary;
- (void)_updateContentVisualStylingWithProvider:(id)a3;
- (void)_updateCoreMaterialVisualStylingProviders;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setBackdropScaleAdjustment:(id)a3;
- (void)setBlurEnabled:(BOOL)a3;
- (void)setCaptureOnly:(BOOL)a3;
- (void)setContentReplacedWithSnapshot:(BOOL)a3;
- (void)setIgnoresScreenClip:(BOOL)a3;
- (void)setRecipe:(int64_t)a3;
- (void)setRecipeName:(id)a3;
- (void)setShouldCrossfade:(BOOL)a3;
- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3;
- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)setZoomEnabled:(BOOL)a3;
@end

@implementation _MTStaticVisualStylingMaterialView

- (void)setRecipe:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MTStaticVisualStylingMaterialView;
  [(MTMaterialView *)&v4 setRecipe:a3];
  [(_MTStaticVisualStylingMaterialView *)self _invalidateContentVisualStyling];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  [(MTMaterialView *)&v3 layoutSubviews];
  if (!self->_contentVisualStylingProvider) {
    [(_MTStaticVisualStylingMaterialView *)self _updateContentVisualStylingIfNecessary];
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  [(_MTStaticVisualStylingMaterialView *)&v3 didMoveToSuperview];
  [(_MTStaticVisualStylingMaterialView *)self _updateContentVisualStylingWithProvider:self->_contentVisualStylingProvider];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  [(_MTStaticVisualStylingMaterialView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(_MTStaticVisualStylingMaterialView *)self _updateContentVisualStylingIfNecessary];
}

- (id)recipeName
{
  return self->_recipeName;
}

- (void)setRecipeName:(id)a3
{
  v5 = (NSString *)a3;
  recipeName = self->_recipeName;
  if (recipeName != v5 && ![(NSString *)recipeName isEqualToString:v5])
  {
    objc_storeStrong((id *)&self->_recipeName, a3);
    [(_MTStaticVisualStylingMaterialView *)self _invalidateContentVisualStyling];
  }

  MEMORY[0x270F9A758]();
}

- (BOOL)isBlurEnabled
{
  return 0;
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setBlurEnabled:]();
  }
}

- (BOOL)isZoomEnabled
{
  return 0;
}

- (void)setZoomEnabled:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setZoomEnabled:]();
  }
}

- (BOOL)isCaptureOnly
{
  return 0;
}

- (void)setCaptureOnly:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setCaptureOnly:]();
  }
}

- (id)backdropScaleAdjustment
{
  return 0;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setBackdropScaleAdjustment:]();
  }
}

- (BOOL)shouldCrossfade
{
  return 0;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setShouldCrossfade:]();
  }
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment
{
  return 0;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:]();
  }
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary
{
  return 0;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:]();
  }
}

- (BOOL)ignoresScreenClip
{
  return 0;
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setIgnoresScreenClip:]();
  }
}

- (BOOL)isContentReplacedWithSnapshot
{
  return 0;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR)) {
    -[_MTStaticVisualStylingMaterialView setContentReplacedWithSnapshot:]();
  }
}

- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MTStaticVisualStylingMaterialView;
  id v13 = [(MTMaterialView *)&v16 _initWithCoreMaterialRecipe:v12 fromBundle:a4 options:a5 initialWeighting:a7 scaleAdjustment:a6];
  v14 = v13;
  if (v13) {
    [v13 setRecipeName:v12];
  }

  return v14;
}

- (id)_materialLayer
{
  return 0;
}

- (void)_setCoreMaterialVisualStylingProvider:(id)a3 ForCategory:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6 && (id)*MEMORY[0x263F36758] != v6)
  {
    visualStyleCategoriesToCoreMaterialProviders = self->_visualStyleCategoriesToCoreMaterialProviders;
    if (!visualStyleCategoriesToCoreMaterialProviders)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v9 = self->_visualStyleCategoriesToCoreMaterialProviders;
      self->_visualStyleCategoriesToCoreMaterialProviders = v8;

      visualStyleCategoriesToCoreMaterialProviders = self->_visualStyleCategoriesToCoreMaterialProviders;
    }
    [(NSMutableDictionary *)visualStyleCategoriesToCoreMaterialProviders setObject:v10 forKey:v6];
  }
}

- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3
{
  id v4 = a3;
  v5 = v4;
  id v6 = 0;
  if (v4)
  {
    if ((id)*MEMORY[0x263F36758] != v4)
    {
      id v6 = [(NSMutableDictionary *)self->_visualStyleCategoriesToCoreMaterialProviders objectForKey:v4];
      if (!v6)
      {
        id v6 = objc_alloc_init(MEMORY[0x263F36790]);
        [(_MTStaticVisualStylingMaterialView *)self _setCoreMaterialVisualStylingProvider:v6 ForCategory:v5];
        [(_MTStaticVisualStylingMaterialView *)self _updateCoreMaterialVisualStylingProviders];
      }
    }
  }

  return v6;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_26C647EE8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v7 = [a3 _coreMaterialVisualStylingProvider];
  id v6 = MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
  [(_MTStaticVisualStylingMaterialView *)self _setCoreMaterialVisualStylingProvider:v7 ForCategory:v6];
}

- (void)_updateCoreMaterialVisualStylingProviders
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = 520;
  obj = self->_visualStyleCategoriesToCoreMaterialProviders;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      uint64_t v17 = v5;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "objectForKey:", v8, v17);
        uint64_t v10 = [(MTMaterialView *)self recipe];
        v11 = [(_MTStaticVisualStylingMaterialView *)self recipeName];
        if (v10)
        {
          if ([(MTMaterialView *)self isRecipeDynamic])
          {
            [(_MTStaticVisualStylingMaterialView *)self traitCollection];
            uint64_t v12 = v6;
            v14 = uint64_t v13 = v3;
            uint64_t v15 = [v14 userInterfaceStyle];

            uint64_t v3 = v13;
            uint64_t v6 = v12;
            uint64_t v5 = v17;
          }
          else
          {
            uint64_t v15 = 0;
          }
          uint64_t v16 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(v10, v15);

          v11 = (void *)v16;
        }
        if (v11) {
          [v9 updateVisualStyleSetFromRecipe:v11 andCategory:v8];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)_invalidateContentVisualStyling
{
  contentVisualStylingProvider = self->_contentVisualStylingProvider;
  self->_contentVisualStylingProvider = 0;

  [(_MTStaticVisualStylingMaterialView *)self setNeedsLayout];
}

- (void)_updateContentVisualStylingIfNecessary
{
  if (!self->_contentVisualStylingProvider)
  {
    uint64_t v3 = (MTCoreMaterialVisualStylingProvider *)objc_alloc_init(MEMORY[0x263F36790]);
    contentVisualStylingProvider = self->_contentVisualStylingProvider;
    self->_contentVisualStylingProvider = v3;

    [(MTCoreMaterialVisualStylingProvider *)self->_contentVisualStylingProvider addObserver:self];
    uint64_t v5 = [MEMORY[0x263F1C550] whiteColor];
    [(_MTStaticVisualStylingMaterialView *)self setBackgroundColor:v5];
  }
  uint64_t v6 = [(MTMaterialView *)self recipe];
  uint64_t v7 = [(_MTStaticVisualStylingMaterialView *)self recipeName];
  id v8 = (id)v7;
  if (v6)
  {
    id v12 = (id)v7;
    if ([(MTMaterialView *)self isRecipeDynamic])
    {
      v9 = [(_MTStaticVisualStylingMaterialView *)self traitCollection];
      uint64_t v10 = [v9 userInterfaceStyle];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(v6, v10);

    id v8 = (id)v11;
  }
  if (v8)
  {
    id v13 = v8;
    uint64_t v7 = [(MTCoreMaterialVisualStylingProvider *)self->_contentVisualStylingProvider updateVisualStyleSetGeneratedFromRecipe:v8];
    id v8 = v13;
    if (v7)
    {
      uint64_t v7 = [(_MTStaticVisualStylingMaterialView *)self _updateContentVisualStylingWithProvider:self->_contentVisualStylingProvider];
      id v8 = v13;
    }
  }

  MEMORY[0x270F9A758](v7, v8);
}

- (void)_updateContentVisualStylingWithProvider:(id)a3
{
  id v7 = [a3 visualStylingForStyle:*MEMORY[0x263F36778]];
  [(_MTStaticVisualStylingMaterialView *)self alpha];
  double v5 = v4;
  uint64_t v6 = [(_MTStaticVisualStylingMaterialView *)self layer];
  objc_msgSend(v6, "mt_replaceAllVisualStylingWithStyling:", v7);

  [(_MTStaticVisualStylingMaterialView *)self setAlpha:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_visualStyleCategoriesToCoreMaterialProviders, 0);

  objc_storeStrong((id *)&self->_recipeName, 0);
}

- (void)setBlurEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Blur is not supported", v2, v3, v4, v5, v6);
}

- (void)setZoomEnabled:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Zoom is not supported", v2, v3, v4, v5, v6);
}

- (void)setCaptureOnly:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Capture only is not supported", v2, v3, v4, v5, v6);
}

- (void)setBackdropScaleAdjustment:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Backdrop scale adjustment is not supported", v2, v3, v4, v5, v6);
}

- (void)setShouldCrossfade:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Crossfade is not supported", v2, v3, v4, v5, v6);
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Alpha/scale transformer is not supported", v2, v3, v4, v5, v6);
}

- (void)setIgnoresScreenClip:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Ignores screen clip is not supported", v2, v3, v4, v5, v6);
}

- (void)setContentReplacedWithSnapshot:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2156C1000, v0, v1, "%{public}@: Replacing content with snapshot is not supported", v2, v3, v4, v5, v6);
}

@end