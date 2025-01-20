@interface SectionHeaderOutlineCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SectionHeaderOutlineCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SectionHeaderOutlineCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SectionHeaderOutlineCell" hasInstanceVariable:@"_cellModel" withType:"<SectionHeaderOutlineCellModel>"];
  [v3 validateProtocol:@"SectionHeaderOutlineCellModel" hasRequiredInstanceMethod:@"title"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(SectionHeaderOutlineCellAccessibility *)self safeValueForKey:@"_cellModel"];
  id v3 = [v2 safeStringForKey:@"title"];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8] | *MEMORY[0x263F1CF48];
}

@end