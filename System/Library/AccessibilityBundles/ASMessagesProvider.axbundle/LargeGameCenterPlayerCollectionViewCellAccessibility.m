@interface LargeGameCenterPlayerCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation LargeGameCenterPlayerCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ASMessagesProvider.LargeGameCenterPlayerCollectionViewCell";
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

- (id)accessibilityLabel
{
  v2 = [(LargeGameCenterPlayerCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"alias"];
  v3 = __UIAXStringForVariables();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)LargeGameCenterPlayerCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(LargeGameCenterPlayerCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end