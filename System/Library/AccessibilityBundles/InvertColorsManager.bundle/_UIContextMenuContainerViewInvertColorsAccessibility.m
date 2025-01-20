@interface _UIContextMenuContainerViewInvertColorsAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)addSubview:(id)a3;
@end

@implementation _UIContextMenuContainerViewInvertColorsAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuContainerViewInvertColorsAccessibility;
  [(_UIContextMenuContainerViewInvertColorsAccessibility *)&v7 addSubview:v4];
  if (UIAccessibilityIsInvertColorsEnabled())
  {
    v5 = [(_UIContextMenuContainerViewInvertColorsAccessibility *)self traitCollection];
    v6 = (char *)[v5 userInterfaceStyle];

    if (v6 == (unsigned char *)&dword_0 + 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v4 setAccessibilityVisualEffectHandleBackdrop:1];
      }
    }
  }
}

@end