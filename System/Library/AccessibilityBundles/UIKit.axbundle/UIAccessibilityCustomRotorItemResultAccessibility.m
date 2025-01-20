@interface UIAccessibilityCustomRotorItemResultAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (UIAccessibilityCustomRotorItemResultAccessibility)init;
- (id)description;
@end

@implementation UIAccessibilityCustomRotorItemResultAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIAccessibilityCustomRotorItemResult";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (UIAccessibilityCustomRotorItemResultAccessibility)init
{
  v7[1] = (id)a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityCustomRotorItemResultAccessibility;
  v8 = [(UIAccessibilityCustomRotorItemResultAccessibility *)&v6 init];
  v7[0] = v8;
  id v3 = v7[0];
  id v4 = (id)[MEMORY[0x263F08C38] UUID];
  objc_msgSend(v3, "setUuid:");

  v5 = (UIAccessibilityCustomRotorItemResultAccessibility *)v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)description
{
  v10 = self;
  SEL v9 = a2;
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityCustomRotorItemResultAccessibility;
  id v6 = [(UIAccessibilityCustomRotorItemResultAccessibility *)&v8 description];
  id v5 = (id)[(UIAccessibilityCustomRotorItemResultAccessibility *)v10 targetElement];
  id v4 = (id)[(UIAccessibilityCustomRotorItemResultAccessibility *)v10 targetRange];
  id v7 = (id)[v3 stringWithFormat:@"%@: targetElement: %@, targetRange: %@", v6, v5, v4];

  return v7;
}

@end