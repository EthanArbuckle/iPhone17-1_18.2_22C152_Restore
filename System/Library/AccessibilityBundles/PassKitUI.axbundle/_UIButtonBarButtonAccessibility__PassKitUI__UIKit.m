@interface _UIButtonBarButtonAccessibility__PassKitUI__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation _UIButtonBarButtonAccessibility__PassKitUI__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"_UIButtonBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3 = [(_UIButtonBarButtonAccessibility__PassKitUI__UIKit *)self accessibilityIdentification];
  int v4 = [v3 isEqualToString:kAXCustomButtonIdentifier];

  if (v4) {
    return *MEMORY[0x263F1CEF8];
  }
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarButtonAccessibility__PassKitUI__UIKit;
  return [(_UIButtonBarButtonAccessibility__PassKitUI__UIKit *)&v6 accessibilityTraits];
}

@end