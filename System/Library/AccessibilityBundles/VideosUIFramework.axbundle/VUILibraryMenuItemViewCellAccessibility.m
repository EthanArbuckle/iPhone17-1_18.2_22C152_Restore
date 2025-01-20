@interface VUILibraryMenuItemViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation VUILibraryMenuItemViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUILibraryMenuItemViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"VUILibraryMenuItemViewCell" isKindOfClass:@"UICollectionViewCell"];
  [v3 validateClass:@"VUILibraryMenuItemViewCell" hasProperty:@"titleLabel" withType:"@"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(VUILibraryMenuItemViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VUILibraryMenuItemViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VUILibraryMenuItemViewCellAccessibility *)&v3 accessibilityTraits];
}

@end