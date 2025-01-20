@interface _UIPortalViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setSourceView:(id)a3;
@end

@implementation _UIPortalViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPortalView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setSourceView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPortalViewInvertColorsAccessibility;
  id v4 = a3;
  [(_UIPortalViewInvertColorsAccessibility *)&v6 setSourceView:v4];
  id v5 = objc_msgSend(v4, "accessibilityIgnoresInvertColors", v6.receiver, v6.super_class);

  [(_UIPortalViewInvertColorsAccessibility *)self setAccessibilityIgnoresInvertColors:v5];
}

@end