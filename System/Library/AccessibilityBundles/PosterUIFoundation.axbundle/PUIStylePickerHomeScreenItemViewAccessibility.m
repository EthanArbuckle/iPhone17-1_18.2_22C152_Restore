@interface PUIStylePickerHomeScreenItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PUIStylePickerHomeScreenItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PUIStylePickerHomeScreenItemView";
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
  return (id)[(PUIStylePickerHomeScreenItemViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"label"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)PUIStylePickerHomeScreenItemViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(PUIStylePickerHomeScreenItemViewAccessibility *)&v3 accessibilityTraits];
}

@end