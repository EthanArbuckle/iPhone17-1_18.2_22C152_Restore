@interface ArcadeDownloadPackCategoryButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation ArcadeDownloadPackCategoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.ArcadeDownloadPackCategoryButton";
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
  v2 = [(ArcadeDownloadPackCategoryButtonAccessibility *)self safeSwiftValueForKey:@"titleLabel"];
  v3 = __UIAXStringForVariables();

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