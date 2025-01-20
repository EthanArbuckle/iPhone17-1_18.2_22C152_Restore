@interface PHAbstractDialerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (PHAbstractDialerViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation PHAbstractDialerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAbstractDialerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v9.receiver = self;
  v9.super_class = (Class)PHAbstractDialerViewAccessibility;
  [(PHAbstractDialerViewAccessibility *)&v9 _accessibilityLoadAccessibilityInformation];
  v3 = [(PHAbstractDialerViewAccessibility *)self safeValueForKey:@"_addContactButton"];
  v4 = accessibilityLocalizedString(@"add.number.text");
  [v3 setAccessibilityLabel:v4];

  v5 = [(PHAbstractDialerViewAccessibility *)self safeValueForKey:@"_deleteButton"];
  v6 = accessibilityLocalizedString(@"delete.text");
  [v5 setAccessibilityLabel:v6];

  v7 = [(PHAbstractDialerViewAccessibility *)self safeValueForKey:@"_deleteButton"];
  [v7 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];

  v8 = [(PHAbstractDialerViewAccessibility *)self safeValueForKey:@"_deleteButton"];
  [v8 setAccessibilityIdentifier:@"DeleteButton"];
}

- (PHAbstractDialerViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHAbstractDialerViewAccessibility;
  v3 = -[PHAbstractDialerViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PHAbstractDialerViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];

  return v3;
}

@end