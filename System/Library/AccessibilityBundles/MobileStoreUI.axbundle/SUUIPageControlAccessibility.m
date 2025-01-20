@interface SUUIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation SUUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUIGiftThemeBackgroundView", @"scrollView", "@", 0);
  [v3 validateClass:@"SUUIGiftThemeCollectionView" isKindOfClass:@"UICollectionView"];
}

- (void)accessibilityIncrement
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIPageControlAccessibility;
  [(SUUIPageControlAccessibility *)&v8 accessibilityIncrement];
  id v3 = [(SUUIPageControlAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"GiftThemePageControl"];

  if (v4)
  {
    objc_opt_class();
    v5 = [(SUUIPageControlAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Suuigiftthemeb.isa)];
    v6 = [v5 safeValueForKey:@"scrollView"];
    v7 = __UIAccessibilityCastAsClass();

    [v7 accessibilityScrollLeftPage];
  }
}

- (void)accessibilityDecrement
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIPageControlAccessibility;
  [(SUUIPageControlAccessibility *)&v8 accessibilityDecrement];
  id v3 = [(SUUIPageControlAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"GiftThemePageControl"];

  if (v4)
  {
    objc_opt_class();
    v5 = [(SUUIPageControlAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Suuigiftthemeb.isa)];
    v6 = [v5 safeValueForKey:@"scrollView"];
    v7 = __UIAccessibilityCastAsClass();

    [v7 accessibilityScrollRightPage];
  }
}

@end