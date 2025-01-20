@interface RPCCUIOptionsControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation RPCCUIOptionsControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"RPCCUIOptionsControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"more.button");
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)RPCCUIOptionsControlAccessibility;
  return *MEMORY[0x263F1CEE8] | [(RPCCUIOptionsControlAccessibility *)&v3 accessibilityTraits];
}

@end