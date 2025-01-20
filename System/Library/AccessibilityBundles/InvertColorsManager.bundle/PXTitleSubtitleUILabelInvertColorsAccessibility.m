@interface PXTitleSubtitleUILabelInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation PXTitleSubtitleUILabelInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXTitleSubtitleUILabel";
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