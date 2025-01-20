@interface UnifiedFieldAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (int64_t)_accessibilitySortPriority;
@end

@implementation UnifiedFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UnifiedField";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITextField", @"_accessibilityRightButtons", "@", 0);
  [v3 validateClass:@"UnifiedField" isKindOfClass:@"UITextField"];
  [v3 validateClass:@"_SFNavigationBar"];
  [v3 validateClass:@"_SFNavigationBar" hasInstanceVariable:@"_URLOutline" withType:"_SFNavigationBarURLButton"];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"address.text");
}

- (id)accessibilityIdentifier
{
  return @"URL";
}

- (id)_accessibilitySupplementaryFooterViews
{
  return (id)[(UnifiedFieldAccessibility *)self safeValueForKey:@"_accessibilityRightButtons"];
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(UnifiedFieldAccessibility *)self _accessibilitySupplementaryFooterViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", self, x, y);
        v14 = objc_msgSend(v13, "_accessibilityHitTest:withEvent:", v7);
        if ([v14 isAccessibilityElement])
        {

          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  v16.receiver = self;
  v16.super_class = (Class)UnifiedFieldAccessibility;
  v14 = -[UnifiedFieldAccessibility _accessibilityHitTest:withEvent:](&v16, sel__accessibilityHitTest_withEvent_, v7, x, y);
LABEL_11:

  return v14;
}

- (int64_t)_accessibilitySortPriority
{
  if (AXDeviceIsPhoneIdiom()) {
    return 1000;
  }
  v4.receiver = self;
  v4.super_class = (Class)UnifiedFieldAccessibility;
  return [(UnifiedFieldAccessibility *)&v4 _accessibilitySortPriority];
}

- (id)accessibilityPath
{
  id v3 = [(UnifiedFieldAccessibility *)self _accessibilityViewAncestorIsKindOf:NSClassFromString(&cfstr_Sfnavigationba_0.isa)];
  objc_super v4 = v3;
  if (v3)
  {
    v5 = [v3 safeValueForKey:@"_URLOutline"];
    v6 = [v5 accessibilityPath];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UnifiedFieldAccessibility;
    v6 = [(UnifiedFieldAccessibility *)&v8 accessibilityPath];
  }

  return v6;
}

@end