@interface SRGuideDetailPhraseViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
@end

@implementation SRGuideDetailPhraseViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRGuideDetailPhraseViewCell";
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