@interface CKInlineStickerBalloonViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
@end

@implementation CKInlineStickerBalloonViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKInlineStickerBalloonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v3 layer];
  +[AXInvertColorsAppHelper toggleInvertColors:v2];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
}

@end