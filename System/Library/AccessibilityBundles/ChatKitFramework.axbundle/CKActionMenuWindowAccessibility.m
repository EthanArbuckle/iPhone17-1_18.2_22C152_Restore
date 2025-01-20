@interface CKActionMenuWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (void)setHidden:(BOOL)a3;
@end

@implementation CKActionMenuWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKActionMenuWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuWindow", @"actionMenuView", "@", 0);
  [v3 validateClass:@"CKActionMenuView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuView", @"defaultActionIndex", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CKActionMenuView", @"actionMenuItems", "@", 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CKActionMenuWindowAccessibility *)self isHidden];
  v10.receiver = self;
  v10.super_class = (Class)CKActionMenuWindowAccessibility;
  [(CKActionMenuWindowAccessibility *)&v10 setHidden:v3];
  if (v5 != v3)
  {
    if (v3)
    {
      v6 = 0;
    }
    else
    {
      v7 = [(CKActionMenuWindowAccessibility *)self safeUIViewForKey:@"actionMenuView"];
      uint64_t v8 = [v7 safeUnsignedIntegerForKey:@"defaultActionIndex"];
      v9 = [v7 safeArrayForKey:@"actionMenuItems"];
      v6 = [v9 axSafeObjectAtIndex:v8];
    }
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v6);
  }
}

@end