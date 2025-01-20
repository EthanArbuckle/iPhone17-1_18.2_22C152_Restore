@interface TPSImageAssetView_TipsWidgetInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation TPSImageAssetView_TipsWidgetInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPSImageAssetView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

@end