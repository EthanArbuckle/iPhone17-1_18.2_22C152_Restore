@interface STStorageTipInfoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation STStorageTipInfoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STStorageTipInfoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF18];
}

- (id)accessibilityLabel
{
  v2 = [(STStorageTipInfoCellAccessibility *)self safeValueForKey:@"_infoLabel"];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end