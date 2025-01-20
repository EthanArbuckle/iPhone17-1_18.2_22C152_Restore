@interface HKMedicalIDEditorNameAndPhotoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (HKMedicalIDEditorNameAndPhotoCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setPhoto:(id)a3;
@end

@implementation HKMedicalIDEditorNameAndPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKMedicalIDEditorNameAndPhotoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HKMedicalIDEditorNameAndPhotoCell" hasInstanceVariable:@"_editPhotoButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorNameAndPhotoCell", @"photo", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKMedicalIDEditorNameAndPhotoCell", @"setPhoto:", "v", "@", 0);
}

- (HKMedicalIDEditorNameAndPhotoCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  v4 = [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)&v6 initWithStyle:a3 reuseIdentifier:a4];
  [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  return v4;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)&v11 _accessibilityLoadAccessibilityInformation];
  id v3 = [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)self safeValueForKey:@"photo"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)self safeValueForKey:@"_editPhotoButton"];
  objc_super v6 = v5;
  if (v4)
  {
    v7 = [v4 _accessibilityPhotoDescription];
    [v6 setAccessibilityTraits:*MEMORY[0x263F1CF00] | *MEMORY[0x263F1CEE8]];
    v8 = accessibilityLocalizedString(@"medical.id.photo");
    v9 = __UIAXStringForVariables();
    objc_msgSend(v6, "setAccessibilityLabel:", v9, v7, @"__AXStringForVariablesSentinel");

    v10 = accessibilityLocalizedString(@"medicalid.edit.photo.hint");
    [v6 setAccessibilityHint:v10];
  }
  else
  {
    [v5 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
    [v6 setAccessibilityHint:0];
    v7 = accessibilityLocalizedString(@"add.photo");
    [v6 setAccessibilityLabel:v7];
  }
}

- (void)setPhoto:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)&v4 setPhoto:a3];
  [(HKMedicalIDEditorNameAndPhotoCellAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end