@interface MTMaterialLayerInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_configureIfNecessaryWithSettingsInterpolator:(id)a3;
@end

@implementation MTMaterialLayerInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTMaterialLayer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_configureIfNecessaryWithSettingsInterpolator:(id)a3
{
  id v4 = a3;
  v5 = [(MTMaterialLayerInvertColorsAccessibility *)self valueForKeyPath:@"filters.InvertColorsDoubleInvert"];

  v7.receiver = self;
  v7.super_class = (Class)MTMaterialLayerInvertColorsAccessibility;
  [(MTMaterialLayerInvertColorsAccessibility *)&v7 _configureIfNecessaryWithSettingsInterpolator:v4];

  if (!_AXSInvertColorsEnabledGlobalCached() && v5)
  {
    v6 = [(MTMaterialLayerInvertColorsAccessibility *)self valueForKeyPath:@"filters.InvertColorsDoubleInvert"];

    if (!v6) {
      +[AXInvertColorsAppHelper toggleInvertColors:self moveFilterToFront:1];
    }
  }
}

@end