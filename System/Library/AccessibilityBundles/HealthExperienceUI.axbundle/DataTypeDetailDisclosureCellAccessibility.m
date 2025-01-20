@interface DataTypeDetailDisclosureCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DataTypeDetailDisclosureCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HealthExperienceUI.DataTypeDetailDisclosureCell";
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
  return (id)MEMORY[0x270F80938](self, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DataTypeDetailDisclosureCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DataTypeDetailDisclosureCellAccessibility *)&v3 accessibilityTraits];
}

@end