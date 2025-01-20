@interface AFUISiriCompactViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)layoutSubviews;
@end

@implementation AFUISiriCompactViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriCompactView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCompactViewInvertColorsAccessibility;
  [(AFUISiriCompactViewInvertColorsAccessibility *)&v4 layoutSubviews];
  v3 = [(AFUISiriCompactViewInvertColorsAccessibility *)self safeUIViewForKey:@"_orbViewContainer"];
  [v3 setAccessibilityIgnoresInvertColors:1];
}

@end