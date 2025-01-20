@interface MobileSafariUIToolbarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityContainingParentForOrdering;
@end

@implementation MobileSafariUIToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NavigationBar"];
  [v3 validateClass:@"BrowserToolbar"];
}

- (id)_accessibilityContainingParentForOrdering
{
  id v3 = [(MobileSafariUIToolbarButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Browsertoolbar.isa)];

  if (!v3
    || ([(MobileSafariUIToolbarButtonAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Navigationbar_0.isa)], (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)MobileSafariUIToolbarButtonAccessibility;
    v4 = [(MobileSafariUIToolbarButtonAccessibility *)&v6 _accessibilityContainingParentForOrdering];
  }

  return v4;
}

@end