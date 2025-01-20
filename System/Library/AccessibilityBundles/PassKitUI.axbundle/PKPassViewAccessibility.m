@interface PKPassViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)accessibilityElementsHidden;
@end

@implementation PKPassViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PKPassView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PKPassViewAccessibility;
  return [(PKPassViewAccessibility *)&v4 accessibilityElementsHidden];
}

@end