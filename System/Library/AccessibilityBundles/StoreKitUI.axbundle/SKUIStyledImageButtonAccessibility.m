@interface SKUIStyledImageButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SKUIStyledImageButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIStyledImageButton";
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
  v3 = [(SKUIStyledImageButtonAccessibility *)self safeValueForKey:@"imageView"];
  v4 = [v3 safeValueForKey:@"image"];
  v5 = [v4 accessibilityIdentifier];
  int v6 = [v5 hasPrefix:@"UIButtonBarAction"];

  if (v6)
  {
    v7 = UIKitAccessibilityLocalizedString();
  }
  else
  {
    v8 = [(SKUIStyledImageButtonAccessibility *)self safeValueForKey:@"imageView"];
    v9 = [v8 safeValueForKey:@"image"];
    v10 = [v9 accessibilityIdentifier];
    int v11 = [v10 hasPrefix:@"UniversalActionControl"];

    if (v11)
    {
      v7 = accessibilitySKUILocalizedString(@"more.button");
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)SKUIStyledImageButtonAccessibility;
      v7 = [(SKUIStyledImageButtonAccessibility *)&v13 accessibilityLabel];
    }
  }

  return v7;
}

@end