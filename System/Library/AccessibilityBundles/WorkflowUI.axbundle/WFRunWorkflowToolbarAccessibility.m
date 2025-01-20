@interface WFRunWorkflowToolbarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)updateShareButtonVisibility;
@end

@implementation WFRunWorkflowToolbarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WFRunWorkflowToolbar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFRunWorkflowToolbar", @"toolbar", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"tintColor", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIBarButtonItem", @"view", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WFRunWorkflowToolbar", @"shareItem", "@", 0);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  [(WFRunWorkflowToolbarAccessibility *)&v3 layoutSubviews];
  [(WFRunWorkflowToolbarAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  [(WFRunWorkflowToolbarAccessibility *)&v21 _accessibilityLoadAccessibilityInformation];
  char v20 = 0;
  objc_opt_class();
  objc_super v3 = [(WFRunWorkflowToolbarAccessibility *)self safeValueForKey:@"toolbar"];
  v4 = __UIAccessibilityCastAsClass();

  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = v4;
  v5 = [v4 items];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 tintColor];
        v12 = [MEMORY[0x263F1C550] clearColor];
        int v13 = [v11 isEqual:v12];

        if (v13)
        {
          v14 = [v10 safeValueForKey:@"view"];
          [v14 setIsAccessibilityElement:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v7);
  }
}

- (void)updateShareButtonVisibility
{
  v8.receiver = self;
  v8.super_class = (Class)WFRunWorkflowToolbarAccessibility;
  [(WFRunWorkflowToolbarAccessibility *)&v8 updateShareButtonVisibility];
  objc_super v3 = [(WFRunWorkflowToolbarAccessibility *)self safeValueForKey:@"shareItem"];
  NSClassFromString(&cfstr_Uibarbuttonite.isa);
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 safeValueForKey:@"tintColor"];
    v5 = [MEMORY[0x263F1C550] clearColor];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      uint64_t v7 = [v3 safeValueForKey:@"view"];
      [v7 setIsAccessibilityElement:0];
    }
  }
}

@end