@interface SUUIStyledImageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SUUIStyledImageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIStyledImageButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v3 = [(SUUIStyledImageButtonAccessibility *)self safeValueForKey:@"imageView"];
  v4 = [v3 safeValueForKey:@"image"];
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 hasPrefix:@"UIButtonBarAction"];

  if (v6)
  {
    v7 = UIKitAccessibilityLocalizedString();
  }
  else
  {
    v8 = [(SUUIStyledImageButtonAccessibility *)self safeValueForKey:@"imageView"];
    v9 = [v8 safeValueForKey:@"image"];
    v10 = [v9 accessibilityIdentifier];
    int v11 = [v10 hasPrefix:@"UniversalActionControl"];

    if (v11)
    {
      v7 = accessibilityLocalizedString(@"more.button");
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SUUIStyledImageButtonAccessibility;
      v7 = [(SUUIStyledImageButtonAccessibility *)&v13 accessibilityLabel];
    }
  }

  return v7;
}

@end