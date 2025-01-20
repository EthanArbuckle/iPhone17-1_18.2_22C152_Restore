@interface SiriUIContentCollectionViewCellInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityIgnoresInvertColors;
- (void)_accessibilityLoadInvertColors;
- (void)_axSetTextColorForView:(id)a3;
- (void)layoutSubviews;
@end

@implementation SiriUIContentCollectionViewCellInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriUIContentCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadInvertColors
{
  AXSafeClassFromString();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v3 = @"_tagPhraseLabel";
  }
  else
  {
    AXSafeClassFromString();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    CFStringRef v3 = @"_textContainerView";
  }
  id v4 = [(SiriUIContentCollectionViewCellInvertColorsAccessibility *)self safeUIViewForKey:v3];
  [(SiriUIContentCollectionViewCellInvertColorsAccessibility *)self _axSetTextColorForView:v4];
}

- (void)_axSetTextColorForView:(id)a3
{
  id v3 = a3;
  if (UIAccessibilityIsInvertColorsEnabled()) {
    +[UIColor siriui_lightTextColor];
  }
  else {
  id v4 = +[UIColor siriui_blendEffectColor];
  }
  [v3 setTextColor:v4];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIContentCollectionViewCellInvertColorsAccessibility;
  [(SiriUIContentCollectionViewCellInvertColorsAccessibility *)&v3 layoutSubviews];
  [(SiriUIContentCollectionViewCellInvertColorsAccessibility *)self _accessibilityLoadInvertColors];
}

@end