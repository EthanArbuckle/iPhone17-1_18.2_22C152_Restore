@interface TPLCDViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TPLCDViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TPLCDView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityIdentifier
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  v2 = [(TPLCDViewAccessibility *)self accessibilityLabel];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)accessibilityLabel
{
  BOOL v3 = [(TPLCDViewAccessibility *)self safeValueForKey:@"_textView"];
  v4 = [v3 accessibilityLabel];

  v5 = [(TPLCDViewAccessibility *)self safeValueForKey:@"_labelView"];
  v6 = [v5 accessibilityLabel];

  v7 = __UIAXStringForVariables();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF48];
}

@end