@interface PlatformSelectorViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PlatformSelectorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.PlatformSelectorView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ASMessagesProvider.PlatformSelectorView", @"accessibilityDescriptionLabel", "@", 0);
  [v3 validateClass:@"AppStoreKitInternal.DynamicTypeLabel" isKindOfClass:@"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(PlatformSelectorViewAccessibility *)self safeValueForKey:@"accessibilityDescriptionLabel"];
  id v3 = [v2 safeValueForKey:@"text"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PlatformSelectorViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PlatformSelectorViewAccessibility *)&v3 accessibilityTraits];
}

@end