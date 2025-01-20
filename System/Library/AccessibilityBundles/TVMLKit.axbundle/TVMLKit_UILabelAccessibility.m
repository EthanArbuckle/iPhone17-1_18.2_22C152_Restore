@interface TVMLKit_UILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_isAccessibilityExplorerElement;
@end

@implementation TVMLKit_UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)_isAccessibilityExplorerElement
{
  v3 = [(TVMLKit_UILabelAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Uiindexbarview.isa)];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TVMLKit_UILabelAccessibility;
    BOOL v4 = [(TVMLKit_UILabelAccessibility *)&v6 _isAccessibilityExplorerElement];
  }

  return v4;
}

@end