@interface CNPhotoPickerSectionHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (CNPhotoPickerSectionHeaderAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CNPhotoPickerSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNPhotoPickerSectionHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNPhotoPickerSectionHeader", @"initWithFrame:", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  [v3 validateClass:@"CNPhotoPickerSectionHeader" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"CNPhotoPickerSectionHeader" hasInstanceVariable:@"_actionButton" withType:"UIButton"];
}

- (CNPhotoPickerSectionHeaderAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeaderAccessibility;
  id v3 = -[CNPhotoPickerSectionHeaderAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(CNPhotoPickerSectionHeaderAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeaderAccessibility;
  [(CNPhotoPickerSectionHeaderAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  uint64_t v3 = *MEMORY[0x263F1CEF8];
  v4 = [(CNPhotoPickerSectionHeaderAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v4 setAccessibilityTraits:v3];
}

- (id)accessibilityElements
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  v4 = [(CNPhotoPickerSectionHeaderAccessibility *)self safeUIViewForKey:@"_titleLabel"];
  [v3 axSafelyAddObject:v4];

  objc_super v5 = [(CNPhotoPickerSectionHeaderAccessibility *)self safeUIViewForKey:@"_actionButton"];
  v6 = [v5 accessibilityLabel];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(CNPhotoPickerSectionHeaderAccessibility *)self safeUIViewForKey:@"_actionButton"];
    [v3 axSafelyAddObject:v8];
  }

  return v3;
}

@end