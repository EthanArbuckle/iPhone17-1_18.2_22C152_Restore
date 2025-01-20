@interface CKUIButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)setHidden:(BOOL)a3;
@end

@implementation CKUIButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)setHidden:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKUIButtonAccessibility;
  [(CKUIButtonAccessibility *)&v8 setHidden:a3];
  v4 = [(CKUIButtonAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"AXRingButtonIdentification"];

  if (v5)
  {
    v6 = [(CKUIButtonAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
    id v7 = (id)[v6 safeValueForKey:@"_accessibilityClearChildren"];

    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
  }
}

@end