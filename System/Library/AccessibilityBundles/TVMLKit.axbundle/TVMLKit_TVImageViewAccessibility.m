@interface TVMLKit_TVImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMLKit_TVImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVImageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TVMLKit_TVImageViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (unint64_t)accessibilityTraits
{
  BOOL v3 = [(TVMLKit_TVImageViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"AXTVMLKitLogoImageViewID"];

  if (v4) {
    return *MEMORY[0x263F1CEF8];
  }
  v6.receiver = self;
  v6.super_class = (Class)TVMLKit_TVImageViewAccessibility;
  return *MEMORY[0x263F1CF20] ^ [(TVMLKit_TVImageViewAccessibility *)&v6 accessibilityTraits];
}

@end