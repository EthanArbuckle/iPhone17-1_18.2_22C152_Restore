@interface UIButtonAccessibility__Translate__UIKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation UIButtonAccessibility__Translate__UIKit

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)UIButtonAccessibility__Translate__UIKit;
  unint64_t v3 = [(UIButtonAccessibility__Translate__UIKit *)&v8 accessibilityTraits];
  v4 = [(UIButtonAccessibility__Translate__UIKit *)self accessibilityIdentifier];
  int v5 = [v4 isEqualToString:@"Play_at_1×"];

  uint64_t v6 = *MEMORY[0x263F1CF40];
  if (!v5) {
    uint64_t v6 = 0;
  }
  return v6 | v3;
}

@end