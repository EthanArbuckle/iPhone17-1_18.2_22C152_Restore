@interface ArcadeDownloadPackCategoryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ArcadeDownloadPackCategoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.ArcadeDownloadPackCategoryButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppInstallExtension.ArcadeDownloadPackCategoryButton" hasSwiftField:@"titleLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"AppInstallExtension.ArcadeDownloadPackCategoryButton" isKindOfClass:@"UIControl"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(ArcadeDownloadPackCategoryButtonAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  id v3 = __UIAXStringForVariables();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  if ([(ArcadeDownloadPackCategoryButtonAccessibility *)self safeSwiftBoolForKey:@"isSelected"])
  {
    v7.receiver = self;
    v7.super_class = (Class)ArcadeDownloadPackCategoryButtonAccessibility;
    unint64_t v3 = *MEMORY[0x263F1CEE8] | [(ArcadeDownloadPackCategoryButtonAccessibility *)&v7 accessibilityTraits];
    unint64_t v4 = *MEMORY[0x263F1CF38];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ArcadeDownloadPackCategoryButtonAccessibility;
    unint64_t v4 = [(ArcadeDownloadPackCategoryButtonAccessibility *)&v6 accessibilityTraits];
    unint64_t v3 = *MEMORY[0x263F1CEE8];
  }
  return v3 | v4;
}

@end