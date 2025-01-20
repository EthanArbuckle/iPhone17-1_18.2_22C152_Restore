@interface CSVibrancyUtility
+ (BOOL)supportsVibrancy;
+ (void)updateVibrantView:(id)a3 backgroundView:(id)a4 colorProvider:(id)a5;
@end

@implementation CSVibrancyUtility

+ (BOOL)supportsVibrancy
{
  return SBUIGraphicsQuality() == 100 && !UIAccessibilityIsReduceTransparencyEnabled();
}

+ (void)updateVibrantView:(id)a3 backgroundView:(id)a4 colorProvider:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v14 = [v9 legibilitySettings];
  v10 = [v7 averageColorForCurrentWallpaper];
  [v9 setBackgroundColor:v10];
  [v9 setBackgroundView:v8];

  [v7 contrastForCurrentWallpaper];
  double v12 = v11;

  v13 = [MEMORY[0x1E4FA60D8] vibrantSettingsWithReferenceColor:v10 referenceContrast:v14 legibilitySettings:v12];
  [v9 setVibrantSettings:v13];
}

@end