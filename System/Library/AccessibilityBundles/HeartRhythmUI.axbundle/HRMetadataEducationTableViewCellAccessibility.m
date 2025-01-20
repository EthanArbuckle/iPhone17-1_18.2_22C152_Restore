@interface HRMetadataEducationTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setUpUI;
@end

@implementation HRMetadataEducationTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HRMetadataEducationTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HRMetadataEducationTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRMetadataEducationTableViewCell", @"_setUpUI", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HRMetadataEducationTableViewCell", @"titleLabel", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
  [(HRMetadataEducationTableViewCellAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HRMetadataEducationTableViewCellAccessibility *)self safeValueForKey:@"titleLabel"];
  uint64_t v4 = [v3 accessibilityTraits];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEF8] | v4];
}

- (id)accessibilityElements
{
  char v9 = 0;
  objc_opt_class();
  id v3 = __UIAccessibilityCastAsClass();
  uint64_t v4 = [v3 contentView];

  if (v4)
  {
    objc_super v5 = [v3 contentView];
    v6 = [v5 _accessibleSubviews];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
    v6 = [(HRMetadataEducationTableViewCellAccessibility *)&v8 accessibilityElements];
  }

  return v6;
}

- (void)_setUpUI
{
  v3.receiver = self;
  v3.super_class = (Class)HRMetadataEducationTableViewCellAccessibility;
  [(HRMetadataEducationTableViewCellAccessibility *)&v3 _setUpUI];
  [(HRMetadataEducationTableViewCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end