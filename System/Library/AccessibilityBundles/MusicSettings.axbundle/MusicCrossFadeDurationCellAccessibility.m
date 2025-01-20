@interface MusicCrossFadeDurationCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axSlider;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_axIncrementSlider:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MusicCrossFadeDurationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicCrossFadeDurationCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return accessibilityMusicSettingsLocalizedString(@"CROSS_FADE");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  v3 = accessibilityMusicSettingsLocalizedString(@"CROSS_FADE_DURATION_FORMAT");
  v4 = [(MusicCrossFadeDurationCellAccessibility *)self _axSlider];
  [v4 value];
  unint64_t v6 = (unint64_t)v5;

  v7 = objc_msgSend(NSString, "localizedStringWithFormat:", v3, v6);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CED8];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)accessibilityPath
{
  return 0;
}

- (void)_axIncrementSlider:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = [(MusicCrossFadeDurationCellAccessibility *)self _axSlider];
  objc_initWeak(&location, v5);

  id v6 = objc_loadWeakRetained(&location);
  [v6 value];
  int v8 = (int)v7;

  if (v3) {
    int v9 = v8 + 1;
  }
  else {
    int v9 = v8 - 1;
  }
  id v10 = objc_loadWeakRetained(&location);
  [v10 maximumValue];
  float v12 = v11;

  id v13 = objc_loadWeakRetained(&location);
  [v13 minimumValue];
  float v15 = v14;

  float v16 = (float)v9;
  if (v15 > (float)v9) {
    float v16 = v15;
  }
  if (v12 < v16) {
    float v16 = v12;
  }
  int v17 = (int)v16;
  objc_initWeak(&from, self);
  objc_copyWeak(&v18, &location);
  int v20 = v17;
  objc_copyWeak(&v19, &from);
  AXPerformSafeBlock();
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __62__MusicCrossFadeDurationCellAccessibility__axIncrementSlider___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(float *)&double v4 = (float)*(int *)(a1 + 48);
  [WeakRetained setValue:v4];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained(v2);
  [v6 sliderValueChanged:v5];
}

- (id)_axSlider
{
  objc_opt_class();
  BOOL v3 = [(MusicCrossFadeDurationCellAccessibility *)self safeValueForKey:@"slider"];
  double v4 = __UIAccessibilityCastAsClass();

  return v4;
}

@end