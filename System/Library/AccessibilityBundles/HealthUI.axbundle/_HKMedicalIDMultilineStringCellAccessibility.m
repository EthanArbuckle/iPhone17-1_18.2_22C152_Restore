@interface _HKMedicalIDMultilineStringCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_HKMedicalIDMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation _HKMedicalIDMultilineStringCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_HKMedicalIDMultilineStringCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKMedicalIDMultilineStringCell", @"titleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_HKMedicalIDMultilineStringCell", @"detailLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(_HKMedicalIDMultilineStringCellAccessibility *)self safeValueForKey:@"titleLabel"];
  v4 = [(_HKMedicalIDMultilineStringCellAccessibility *)self safeValueForKey:@"detailLabel"];
  v5 = [v4 accessibilityLabel];

  v6 = [v3 accessibilityLabel];
  v7 = __UIAXStringForVariables();

  uint64_t v8 = AXBloodTypeStringFromString(v7, v5);
  v9 = (void *)v8;
  if (v8) {
    v10 = (void *)v8;
  }
  else {
    v10 = v7;
  }
  id v11 = v10;

  return v11;
}

- (_HKMedicalIDMultilineStringCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_HKMedicalIDMultilineStringCellAccessibility;
  v4 = [(_HKMedicalIDMultilineStringCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(_HKMedicalIDMultilineStringCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)_HKMedicalIDMultilineStringCellAccessibility;
  [(_HKMedicalIDMultilineStringCellAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(_HKMedicalIDMultilineStringCellAccessibility *)self _accessibilityFindSubviewDescendant:&__block_literal_global_1];
  [v3 setIsAccessibilityElement:0];
}

@end