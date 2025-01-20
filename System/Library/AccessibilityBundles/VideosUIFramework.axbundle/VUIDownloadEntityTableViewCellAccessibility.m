@interface VUIDownloadEntityTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation VUIDownloadEntityTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIDownloadEntityTableViewCell";
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
  return *MEMORY[0x263F1CEE8];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadEntityTableViewCellAccessibility;
  [(VUIDownloadEntityTableViewCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(VUIDownloadEntityTableViewCellAccessibility *)self safeValueForKey:@"dotSeparatorLabel"];
  [v3 setIsAccessibilityElement:0];
}

@end