@interface MTMaterialSettingsInterpolator
+ (id)_filteringProtocolGetterNames;
- (BOOL)_isBackdropRequiredWithSettings:(id)a3;
- (BOOL)_isBackdropRequiredWithSubSettings:(id)a3;
- (BOOL)_isPropertyEnabled:(id)a3 consideringWeighting:(BOOL)a4;
- (BOOL)_isTintEnabledWithSettings:(id)a3;
- (BOOL)isAverageColorEnabled;
- (BOOL)isAverageColorEnabledEver;
- (BOOL)isBackdropRequiredEver;
- (BOOL)isBackdropRequiredFinally;
- (BOOL)isBackdropRequiredInitially;
- (BOOL)isBlurAtEnd;
- (BOOL)isBlurEnabled;
- (BOOL)isBrightnessEnabled;
- (BOOL)isColorMatrixEnabled;
- (BOOL)isCurvesEnabled;
- (BOOL)isLuminanceEnabled;
- (BOOL)isOverlay;
- (BOOL)isSaturationEnabled;
- (BOOL)isTintEnabled;
- (BOOL)isWeightingChanging;
- (BOOL)isZoomEnabled;
- (CAColorMatrix)colorMatrix;
- (CGImage)variableBlurInputMask;
- (MTColor)tintColor;
- (MTMaterialSettingsInterpolator)initWithSettings:(id)a3;
- (MTRecipeMaterialSettingsProviding)finalSettings;
- (MTRecipeMaterialSettingsProviding)initialSettings;
- (NSDictionary)curvesValues;
- (NSString)blurInputQuality;
- (double)_floatPropertyValueForProperty:(id)a3;
- (double)_floatPropertyValueForProperty:(id)a3 withTransformer:(id)a4;
- (double)backdropScale;
- (double)blurRadius;
- (double)brightness;
- (double)luminanceAmount;
- (double)saturation;
- (double)tintAlpha;
- (double)weighting;
- (double)zoom;
- (id)_averageColorEnabledWithSettings:(id)a3;
- (id)_backdropScaleWithSettings:(id)a3;
- (id)_blurRadiusWithSettings:(id)a3;
- (id)_brightnessWithSettings:(id)a3;
- (id)_colorMatrixColorWithSettings:(id)a3 alpha:(double)a4;
- (id)_colorMatrixWithSettings:(id)a3;
- (id)_colorWithGetterBlock:(id)a3;
- (id)_filteringProperty:(id)a3 withSettings:(id)a4;
- (id)_luminanceAmountWithSettings:(id)a3;
- (id)_luminanceInputValues;
- (id)_propertyValueForProperty:(id)a3 withTransformer:(id)a4;
- (id)_saturationWithSettings:(id)a3;
- (id)_tintAlphaWithSettings:(id)a3;
- (id)_zoomWithSettings:(id)a3;
- (id)blurRadiusTransformer;
- (id)description;
- (id)initialSettingsInterpolator;
- (void)finalizeWeighting;
- (void)setBlurRadiusTransformer:(id)a3;
- (void)setFinalSettings:(id)a3;
- (void)setInitialSettings:(id)a3;
- (void)setWeighting:(double)a3;
@end

@implementation MTMaterialSettingsInterpolator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_blurRadiusTransformer, 0);
  objc_storeStrong((id *)&self->_initialSettings, 0);
  objc_storeStrong((id *)&self->_finalSettings, 0);
}

void __69__MTMaterialSettingsInterpolator__isBackdropRequiredWithSubSettings___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  int v5 = [v9 isEqualToString:@"curvesValues"];
  v6 = [*(id *)(a1 + 32) valueForKey:v9];
  v7 = v6;
  if (v5) {
    char v8 = v6 != 0;
  }
  else {
    char v8 = objc_msgSend(v6, "mt_isIdentityValueForMaterialSettingsProperty:", v9) ^ 1;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;

  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (MTRecipeMaterialSettingsProviding)finalSettings
{
  return self->_finalSettings;
}

- (BOOL)isWeightingChanging
{
  return !MTFloatEqualToFloat(self->_previousWeighting, self->_weighting);
}

- (BOOL)isBackdropRequiredEver
{
  if ([(MTMaterialSettingsInterpolator *)self isBackdropRequiredFinally]) {
    return 1;
  }
  return [(MTMaterialSettingsInterpolator *)self isBackdropRequiredInitially];
}

- (BOOL)isBackdropRequiredFinally
{
  return [(MTMaterialSettingsInterpolator *)self _isBackdropRequiredWithSettings:self->_finalSettings];
}

- (BOOL)_isBackdropRequiredWithSettings:(id)a3
{
  v4 = [a3 baseMaterialSettings];
  LOBYTE(self) = [(MTMaterialSettingsInterpolator *)self _isBackdropRequiredWithSubSettings:v4];

  return (char)self;
}

- (BOOL)_isBackdropRequiredWithSubSettings:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (v3)
  {
    v4 = [(id)objc_opt_class() _filteringProtocolGetterNames];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__MTMaterialSettingsInterpolator__isBackdropRequiredWithSubSettings___block_invoke;
    v7[3] = &unk_1E5F1B670;
    id v9 = &v10;
    id v8 = v3;
    [v4 enumerateObjectsUsingBlock:v7];

    BOOL v5 = *((unsigned char *)v11 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  _Block_object_dispose(&v10, 8);

  return v5;
}

- (void)setWeighting:(double)a3
{
  double weighting = self->_weighting;
  if (weighting != a3)
  {
    self->_previousWeighting = weighting;
    self->_double weighting = a3;
  }
}

- (NSString)blurInputQuality
{
  initialSettings = self->_initialSettings;
  v4 = @"default";
  if (initialSettings)
  {
    BOOL v5 = [(MTRecipeMaterialSettingsProviding *)initialSettings baseMaterialSettings];
    uint64_t v6 = [v5 blurInputQuality];
    v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = @"default";
    }
    v4 = v8;
  }
  id v9 = [(MTRecipeMaterialSettingsProviding *)self->_finalSettings baseMaterialSettings];
  uint64_t v10 = [v9 blurInputQuality];

  if (MTCompareBlurInputQualities(v4, v10) == -1) {
    v11 = v4;
  }
  else {
    v11 = v10;
  }
  uint64_t v12 = v11;

  return v12;
}

- (void)setInitialSettings:(id)a3
{
}

- (MTMaterialSettingsInterpolator)initWithSettings:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MTMaterialSettingsInterpolator;
  BOOL v5 = [(MTMaterialSettingsInterpolator *)&v8 init];
  uint64_t v6 = v5;
  if (v5) {
    [(MTMaterialSettingsInterpolator *)v5 setFinalSettings:v4];
  }

  return v6;
}

- (void)setFinalSettings:(id)a3
{
}

- (MTRecipeMaterialSettingsProviding)initialSettings
{
  return self->_initialSettings;
}

- (BOOL)isBlurEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"blurRadius" consideringWeighting:0];
}

- (double)_floatPropertyValueForProperty:(id)a3 withTransformer:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __81__MTMaterialSettingsInterpolator__floatPropertyValueForProperty_withTransformer___block_invoke;
  v14[3] = &unk_1E5F1B648;
  SEL v16 = a2;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(MTMaterialSettingsInterpolator *)self _propertyValueForProperty:a3 withTransformer:v14];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    char v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MTMaterialSettingsInterpolator.m" lineNumber:250 description:@"Didn't get back a number as expected"];
  }
  [v9 floatValue];
  double v11 = v10;

  return v11;
}

- (double)weighting
{
  return self->_weighting;
}

- (id)_propertyValueForProperty:(id)a3 withTransformer:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *, void *, double))a4;
  id v9 = [NSString stringWithFormat:@"_%@WithSettings:", v7];
  SEL v10 = NSSelectorFromString(v9);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 236, @"This class doesn't respond to constructed selector '%@'", v9 object file lineNumber description];
  }
  if (self->_initialSettings)
  {
    id v11 = (id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F29238], "mt_identityValueForMaterialSettingsProperty:", v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v12 = v11;
  char v13 = [(MTMaterialSettingsInterpolator *)self performSelector:v10 withObject:self->_finalSettings];
  v14 = v13;
  if (v8)
  {
    v8[2](v8, v12, v13, self->_weighting);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v13;
  }
  SEL v16 = v15;

  return v16;
}

- (BOOL)_isPropertyEnabled:(id)a3 consideringWeighting:(BOOL)a4
{
  id v7 = a3;
  id v8 = [NSString stringWithFormat:@"_%@WithSettings:", v7];
  SEL v9 = NSSelectorFromString(v8);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 224, @"This class doesn't respond to constructed selector '%@'", v8 object file lineNumber description];
  }
  if (self->_initialSettings) {
    int v10 = objc_msgSend((id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v9), "mt_isIdentityValueForMaterialSettingsProperty:", v7) ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }
  char v11 = objc_msgSend((id)-[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v9, self->_finalSettings), "mt_isIdentityValueForMaterialSettingsProperty:", v7);
  double weighting = self->_weighting;
  BOOL v13 = !a4;
  BOOL v14 = weighting < 1.0 || !a4;
  BOOL v15 = v10 & v14;
  if (weighting > 0.0) {
    BOOL v13 = 1;
  }
  if (v15) {
    BOOL v13 = v15;
  }
  if (v11) {
    BOOL v16 = v15;
  }
  else {
    BOOL v16 = v13;
  }

  return v16;
}

- (id)_filteringProperty:(id)a3 withSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  SEL v9 = [(id)objc_opt_class() _filteringProtocolGetterNames];
  char v10 = [v9 containsObject:v7];

  if ((v10 & 1) == 0)
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 325, @"Invalid parameter not satisfying: %@", @"[[[self class] _filteringProtocolGetterNames] containsObject:filteringProperty]" object file lineNumber description];
  }
  char v11 = [v8 baseMaterialSettings];
  uint64_t v12 = [v11 valueForKey:v7];

  return v12;
}

+ (id)_filteringProtocolGetterNames
{
  if (_filteringProtocolGetterNames_onceToken != -1) {
    dispatch_once(&_filteringProtocolGetterNames_onceToken, &__block_literal_global_53);
  }
  v2 = (void *)_filteringProtocolGetterNames___filteringProtocolSelectorNames;
  return v2;
}

- (id)_blurRadiusWithSettings:(id)a3
{
  return [(MTMaterialSettingsInterpolator *)self _filteringProperty:@"blurRadius" withSettings:a3];
}

id __81__MTMaterialSettingsInterpolator__floatPropertyValueForProperty_withTransformer___block_invoke(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v7 && (objc_opt_respondsToSelector() & 1) == 0 || v8 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a1[6], a1[4], @"MTMaterialSettingsInterpolator.m", 247, @"Invalid parameter not satisfying: %@", @"(!initialValue || [initialValue respondsToSelector:@selector(floatValue)]) && (!finalValue || [finalValue respondsToSelector:@selector(floatValue)])" object file lineNumber description];
  }
  uint64_t v9 = a1[5];
  char v10 = NSNumber;
  [v7 floatValue];
  if (v9)
  {
    double v12 = v11;
    [v8 floatValue];
    (*(void (**)(uint64_t, double, double, double))(v9 + 16))(v9, a4, v12, v13);
  }
  else
  {
    double v15 = v11;
    [v8 floatValue];
    float v17 = v16;
    [v7 floatValue];
    double v14 = v15 + a4 * (float)(v17 - v18);
  }
  v19 = [v10 numberWithDouble:v14];

  return v19;
}

- (NSDictionary)curvesValues
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(MTRecipeMaterialSettingsProviding *)self->_initialSettings baseMaterialSettings];
  uint64_t v42 = [v4 curvesValues];

  BOOL v5 = [(MTRecipeMaterialSettingsProviding *)self->_finalSettings baseMaterialSettings];
  uint64_t v40 = [v5 curvesValues];

  uint64_t v6 = v3;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  MTCAFilterCurvesInputValuesKeys();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v44;
    id v36 = v3;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v44 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v43 + 1) + 8 * v7);
        uint64_t v9 = [(id)v42 objectForKey:v8];
        uint64_t v10 = [(id)v40 objectForKey:v8];
        float v11 = (void *)v10;
        if (!(v9 | v10))
        {
          id v14 = 0;
          goto LABEL_38;
        }
        uint64_t v38 = v8;
        if (v9)
        {
          uint64_t v12 = [(id)v9 count];
          if (v12 == 4 && v11 != 0) {
LABEL_15:
          }
            uint64_t v12 = [v11 count];
          if (v12 != 4)
          {
            [MEMORY[0x1E4F28B00] currentHandler];
            v33 = v32 = v6;
            [v33 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 179, @"Either 'initialValues' (%@) or 'finalValues' (%@) doesn't have the required number of objects (4)", v9, v11 object file lineNumber description];

            uint64_t v6 = v32;
          }
          if (v9) {
            BOOL v15 = v11 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            uint64_t v17 = 0;
            while (1)
            {
              if (MTFloatIsZero(self->_weighting))
              {
                float v18 = (void *)v9;
              }
              else
              {
                if (!MTFloatIsOne(self->_weighting))
                {
                  v20 = NSNumber;
                  v21 = [(id)v9 objectAtIndexedSubscript:v17];
                  [v21 floatValue];
                  double v23 = v22;
                  double weighting = self->_weighting;
                  v25 = [v11 objectAtIndexedSubscript:v17];
                  [v25 floatValue];
                  float v27 = v26;
                  v28 = [(id)v9 objectAtIndexedSubscript:v17];
                  [v28 floatValue];
                  double v30 = v23 + weighting * (float)(v27 - v29);

                  uint64_t v19 = [v20 numberWithDouble:v30];
                  goto LABEL_34;
                }
                float v18 = v11;
              }
              uint64_t v19 = [v18 objectAtIndexedSubscript:v17];
LABEL_34:
              v31 = (void *)v19;
              [v14 addObject:v19];

              if (++v17 == 4)
              {
                uint64_t v6 = v36;
                goto LABEL_37;
              }
            }
          }
          goto LABEL_23;
        }
        if (v10) {
          goto LABEL_15;
        }
LABEL_23:
        if (v42 | v40)
        {
          if (v42) {
            float v16 = (void *)v9;
          }
          else {
            float v16 = v11;
          }
          id v14 = v16;
        }
        else
        {
          id v14 = 0;
        }
LABEL_37:
        [v6 setObject:v14 forKey:v38];
LABEL_38:

        ++v7;
      }
      while (v7 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v41);
  }

  return (NSDictionary *)v6;
}

- (BOOL)_isTintEnabledWithSettings:(id)a3
{
  if (a3)
  {
    id v3 = -[MTMaterialSettingsInterpolator _tintAlphaWithSettings:](self, "_tintAlphaWithSettings:");
    int v4 = objc_msgSend(v3, "mt_isIdentityValueForMaterialSettingsProperty:", @"tintAlpha") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)_tintAlphaWithSettings:(id)a3
{
  id v3 = [a3 baseMaterialSettings];
  int v4 = NSNumber;
  [v3 tintAlpha];
  BOOL v5 = objc_msgSend(v4, "numberWithDouble:");

  return v5;
}

- (id)_saturationWithSettings:(id)a3
{
  return [(MTMaterialSettingsInterpolator *)self _filteringProperty:@"saturation" withSettings:a3];
}

- (id)_luminanceAmountWithSettings:(id)a3
{
  return [(MTMaterialSettingsInterpolator *)self _filteringProperty:@"luminanceAmount" withSettings:a3];
}

- (id)_brightnessWithSettings:(id)a3
{
  return [(MTMaterialSettingsInterpolator *)self _filteringProperty:@"brightness" withSettings:a3];
}

double __47__MTMaterialSettingsInterpolator_backdropScale__block_invoke(double a1, double a2, double a3)
{
  if (a2 >= a3) {
    double result = a2;
  }
  else {
    double result = a3;
  }
  if (a2 >= a3) {
    double v4 = a3;
  }
  else {
    double v4 = a2;
  }
  if (a3 != 0.0 && a2 != 0.0) {
    return v4;
  }
  return result;
}

- (id)_backdropScaleWithSettings:(id)a3
{
  id v3 = NSNumber;
  double v4 = [a3 baseMaterialSettings];
  [v4 backdropScale];
  BOOL v5 = objc_msgSend(v3, "numberWithDouble:");

  return v5;
}

- (CGImage)variableBlurInputMask
{
  if (self->_initialSettings) {
    return 0;
  }
  id v3 = [(MTRecipeMaterialSettingsProviding *)self->_finalSettings baseMaterialSettings];
  double v4 = (CGImage *)[v3 variableBlurInputMask];

  return v4;
}

- (BOOL)isTintEnabled
{
  if ([(MTMaterialSettingsInterpolator *)self _isTintEnabledWithSettings:self->_initialSettings])
  {
    return 1;
  }
  finalSettings = self->_finalSettings;
  return [(MTMaterialSettingsInterpolator *)self _isTintEnabledWithSettings:finalSettings];
}

- (BOOL)isSaturationEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"saturation" consideringWeighting:0];
}

- (BOOL)isLuminanceEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"luminanceAmount" consideringWeighting:0];
}

- (BOOL)isCurvesEnabled
{
  SEL v4 = NSSelectorFromString(&cfstr_Curvesvalues.isa);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 101, @"This class doesn't respond to constructed selector '%@'", @"curvesValues" object file lineNumber description];
  }
  if (self->_initialSettings) {
    BOOL v5 = -[MTMaterialSettingsInterpolator performSelector:withObject:](self, "performSelector:withObject:", v4) != 0;
  }
  else {
    BOOL v5 = 0;
  }
  return [(MTMaterialSettingsInterpolator *)self performSelector:v4 withObject:self->_finalSettings]|| v5;
}

- (BOOL)isColorMatrixEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"colorMatrix" consideringWeighting:0];
}

- (BOOL)isBrightnessEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"brightness" consideringWeighting:0];
}

- (BOOL)isBlurAtEnd
{
  v2 = [(MTRecipeMaterialSettingsProviding *)self->_finalSettings baseMaterialSettings];
  char v3 = [v2 isBlurAtEnd];

  return v3;
}

- (double)blurRadius
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"blurRadius" withTransformer:self->_blurRadiusTransformer];
  return result;
}

- (id)_colorMatrixWithSettings:(id)a3
{
  return [(MTMaterialSettingsInterpolator *)self _filteringProperty:@"colorMatrix" withSettings:a3];
}

- (double)backdropScale
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"backdropScale" withTransformer:&__block_literal_global_40];
  return result;
}

- (double)_floatPropertyValueForProperty:(id)a3
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:a3 withTransformer:0];
  return result;
}

- (BOOL)isZoomEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"zoom" consideringWeighting:0];
}

- (id)_zoomWithSettings:(id)a3
{
  char v3 = NSNumber;
  SEL v4 = [a3 baseMaterialSettings];
  [v4 zoom];
  BOOL v5 = objc_msgSend(v3, "numberWithDouble:");

  return v5;
}

- (double)saturation
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"saturation"];
  return result;
}

- (double)luminanceAmount
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"luminanceAmount"];
  return result;
}

- (double)brightness
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"brightness"];
  return result;
}

- (MTColor)tintColor
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__MTMaterialSettingsInterpolator_tintColor__block_invoke;
  v4[3] = &unk_1E5F1B620;
  v4[4] = self;
  v2 = [(MTMaterialSettingsInterpolator *)self _colorWithGetterBlock:v4];
  return (MTColor *)v2;
}

- (id)_colorWithGetterBlock:(id)a3
{
  BOOL v5 = (void (**)(void, double))a3;
  if (!v5)
  {
    float v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 259, @"Invalid parameter not satisfying: %@", @"getter" object file lineNumber description];
  }
  if (self->_initialSettings)
  {
    uint64_t v6 = -[MTMaterialSettingsInterpolator _tintAlphaWithSettings:](self, "_tintAlphaWithSettings:");
  }
  else
  {
    uint64_t v6 = 0;
  }
  if (self->_initialSettings)
  {
    [v6 doubleValue];
    double v8 = v7 * (1.0 - self->_weighting);
  }
  else
  {
    double v8 = 0.0;
  }
  uint64_t v9 = [(MTMaterialSettingsInterpolator *)self _tintAlphaWithSettings:self->_finalSettings];
  [v9 doubleValue];
  double v11 = v10 * self->_weighting;
  if (self->_initialSettings)
  {
    uint64_t v12 = v5[2](v5, v8);
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v13 = ((void (*)(void (**)(void, double), MTRecipeMaterialSettingsProviding *, double))v5[2])(v5, self->_finalSettings, v11);
  id v14 = (void *)v13;
  if (!(v12 | v13)) {
    goto LABEL_21;
  }
  if (!v12 || !v13)
  {
    if (v12)
    {
      id v19 = (id)v12;
LABEL_20:
      float v18 = v19;
      goto LABEL_22;
    }
    if (v13)
    {
      id v19 = (id)v13;
      goto LABEL_20;
    }
LABEL_21:
    float v18 = 0;
    goto LABEL_22;
  }
  BOOL v15 = [(id)v12 colorWithAlphaComponent:v8];
  float v16 = [v14 colorWithAlphaComponent:v11];
  uint64_t v17 = [v15 colorBlendedWithColor:v16];
  float v18 = [v17 colorWithAlphaComponent:v11];

LABEL_22:
  id v20 = v18;

  return v20;
}

uint64_t __43__MTMaterialSettingsInterpolator_tintColor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_colorMatrixColorWithSettings:alpha:", a2);
}

- (id)_colorMatrixColorWithSettings:(id)a3 alpha:(double)a4
{
  id v5 = [a3 baseMaterialSettings];
  if ([v5 tintColor])
  {
    uint64_t v6 = +[MTColor colorWithCGColor:](MTColor, "colorWithCGColor:", [v5 tintColor]);
    double v7 = [v6 colorWithAlphaComponent:a4];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)setBlurRadiusTransformer:(id)a3
{
}

- (id)_luminanceInputValues
{
  initialSettings = self->_initialSettings;
  if (initialSettings)
  {
    id v5 = [(MTRecipeMaterialSettingsProviding *)initialSettings baseMaterialSettings];
    uint64_t v6 = [v5 luminanceValues];
  }
  else
  {
    uint64_t v6 = 0;
  }
  double v7 = [(MTRecipeMaterialSettingsProviding *)self->_finalSettings baseMaterialSettings];
  uint64_t v8 = [v7 luminanceValues];

  if (v6 | v8)
  {
    if (v6 && v8)
    {
      if ([(id)v6 count] != 4 || objc_msgSend((id)v8, "count") != 4)
      {
        v28 = [MEMORY[0x1E4F28B00] currentHandler];
        [v28 handleFailureInMethod:a2, self, @"MTMaterialSettingsInterpolator.m", 285, @"Either 'initialValues' (%@) or 'finalValues' (%@) doesn't have the required number of objects (4)", v6, v8 object file lineNumber description];
      }
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = 0;
      while (1)
      {
        if (MTFloatIsZero(self->_weighting))
        {
          double v11 = (void *)v6;
        }
        else
        {
          if (!MTFloatIsOne(self->_weighting))
          {
            uint64_t v13 = NSNumber;
            id v14 = [(id)v6 objectAtIndexedSubscript:v10];
            [v14 floatValue];
            double v16 = v15;
            double weighting = self->_weighting;
            float v18 = [(id)v8 objectAtIndexedSubscript:v10];
            [v18 floatValue];
            float v20 = v19;
            v21 = [(id)v6 objectAtIndexedSubscript:v10];
            [v21 floatValue];
            double v23 = v16 + weighting * (float)(v20 - v22);

            uint64_t v12 = [v13 numberWithDouble:v23];
            goto LABEL_16;
          }
          double v11 = (void *)v8;
        }
        uint64_t v12 = [v11 objectAtIndexedSubscript:v10];
LABEL_16:
        v24 = (void *)v12;
        [v9 addObject:v12];

        if (++v10 == 4) {
          goto LABEL_23;
        }
      }
    }
    if (v6) {
      v25 = (void *)v6;
    }
    else {
      v25 = (void *)v8;
    }
    id v9 = v25;
  }
  else
  {
    id v9 = 0;
  }
LABEL_23:
  id v26 = v9;

  return v26;
}

- (id)initialSettingsInterpolator
{
  finalSettings = self->_finalSettings;
  if (finalSettings)
  {
    if (self->_initialSettings) {
      finalSettings = self->_initialSettings;
    }
    SEL v4 = finalSettings;
    id v5 = [[MTMaterialSettingsInterpolator alloc] initWithSettings:v4];

    [(MTMaterialSettingsInterpolator *)v5 setWeighting:self->_previousWeighting];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)finalizeWeighting
{
  self->_previousWeighting = self->_weighting;
}

- (BOOL)isBackdropRequiredInitially
{
  return self->_initialSettings
      && -[MTMaterialSettingsInterpolator _isBackdropRequiredWithSettings:](self, "_isBackdropRequiredWithSettings:");
}

- (BOOL)isAverageColorEnabledEver
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"averageColorEnabled" consideringWeighting:0];
}

- (CAColorMatrix)colorMatrix
{
  SEL v4 = [(MTMaterialSettingsInterpolator *)self _propertyValueForProperty:@"colorMatrix" withTransformer:&__block_literal_global_3];
  if (v4)
  {
    uint64_t v6 = v4;
    [v4 CAColorMatrixValue];
    SEL v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m42 = 0u;
    *(_OWORD *)&retstr->m15 = 0u;
    *(_OWORD *)&retstr->m24 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
  }

  return result;
}

id __45__MTMaterialSettingsInterpolator_colorMatrix__block_invoke(double a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = (void *)MEMORY[0x1E4F29238];
  if (v6)
  {
    [v6 CAColorMatrixValue];
    if (v8)
    {
LABEL_3:
      [v8 CAColorMatrixValue];
      goto LABEL_6;
    }
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    if (v7) {
      goto LABEL_3;
    }
  }
  memset(v12, 0, sizeof(v12));
LABEL_6:
  uint64_t v10 = objc_msgSend(v9, "valueWithBytes:objCType:", v14, "{CAColorMatrix=ffffffffffffffffffff}", *(double *)MTCAColorMatrixInterpolate(v13, v12, v14, a1).i64);

  return v10;
}

- (double)tintAlpha
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"tintAlpha"];
  return result;
}

- (double)zoom
{
  [(MTMaterialSettingsInterpolator *)self _floatPropertyValueForProperty:@"zoom"];
  return result;
}

- (BOOL)isAverageColorEnabled
{
  return [(MTMaterialSettingsInterpolator *)self _isPropertyEnabled:@"averageColorEnabled" consideringWeighting:1];
}

uint64_t __63__MTMaterialSettingsInterpolator__filteringProtocolGetterNames__block_invoke()
{
  _filteringProtocolGetterNames___filteringProtocolSelectorNames = MTProtocolGetProperties(&unk_1F06A8360, 3);
  return MEMORY[0x1F41817F8]();
}

- (id)_averageColorEnabledWithSettings:(id)a3
{
  char v3 = NSNumber;
  SEL v4 = [a3 baseMaterialSettings];
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "isAverageColorEnabled"));

  return v5;
}

- (id)description
{
  objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"<%@: %p; final settings: %@",
    objc_opt_class(),
    self,
  char v3 = self->_finalSettings);
  SEL v4 = v3;
  if (self->_initialSettings) {
    [v3 appendFormat:@"; initial settings: %@", self->_initialSettings];
  }
  objc_msgSend(v4, "appendFormat:", @"; weighting: %f>", *(void *)&self->_weighting);
  return v4;
}

- (BOOL)isOverlay
{
  return self->_overlay;
}

- (id)blurRadiusTransformer
{
  return self->_blurRadiusTransformer;
}

@end