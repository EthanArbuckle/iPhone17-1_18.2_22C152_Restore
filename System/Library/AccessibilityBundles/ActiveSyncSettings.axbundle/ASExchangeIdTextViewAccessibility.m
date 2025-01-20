@interface ASExchangeIdTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation ASExchangeIdTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASExchangeIdTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)ASExchangeIdTextViewAccessibility;
  return [(ASExchangeIdTextViewAccessibility *)&v3 accessibilityTraits] & ~*MEMORY[0x263F1CEE8];
}

@end