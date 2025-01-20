@interface TSSIMUnlockDetailViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TSSIMUnlockDetailViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TSSIMUnlockDetailViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSSIMUnlockDetailView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TSSIMUnlockDetailView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TSSIMUnlockDetailView", @"initWithActionType:actionSubtype:", "@", "q", "q", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)TSSIMUnlockDetailViewAccessibility;
  [(TSSIMUnlockDetailViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(TSSIMUnlockDetailViewAccessibility *)self safeValueForKey:@"_titleLabel"];
  [v3 _accessibilityAddTrait:*MEMORY[0x263F1CEF8]];
}

- (TSSIMUnlockDetailViewAccessibility)initWithActionType:(int64_t)a3 actionSubtype:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSSIMUnlockDetailViewAccessibility;
  objc_super v4 = [(TSSIMUnlockDetailViewAccessibility *)&v7 initWithActionType:a3 actionSubtype:a4];
  v5 = v4;
  if (v4) {
    [(TSSIMUnlockDetailViewAccessibility *)v4 _accessibilityLoadAccessibilityInformation];
  }

  return v5;
}

@end