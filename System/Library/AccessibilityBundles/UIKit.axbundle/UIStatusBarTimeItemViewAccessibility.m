@interface UIStatusBarTimeItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarTimeItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarTimeItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  id v5 = (id)[(UIStatusBarTimeItemViewAccessibility *)self safeValueForKey:@"_dateTimeString"];
  id v4 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v3 = (id)objc_msgSend(v5, "stringByTrimmingCharactersInSet:");
  BOOL v6 = [v3 length] != 0;

  return v6;
}

- (id)accessibilityLabel
{
  v6[2] = self;
  v6[1] = (id)a2;
  id v3 = (void *)MEMORY[0x263F21660];
  id v4 = (id)[(UIStatusBarTimeItemViewAccessibility *)self safeValueForKey:@"_dateTimeString"];
  v6[0] = (id)objc_msgSend(v3, "axAttributedStringWithString:");

  [v6[0] setAttribute:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F21708]];
  id v5 = v6[0];
  objc_storeStrong(v6, 0);

  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarTimeItemViewAccessibility;
  return [(UIStatusBarTimeItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0] | *MEMORY[0x263F1CF68];
}

@end