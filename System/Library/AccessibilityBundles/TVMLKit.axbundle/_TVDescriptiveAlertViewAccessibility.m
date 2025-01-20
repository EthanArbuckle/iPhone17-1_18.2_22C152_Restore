@interface _TVDescriptiveAlertViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsInTVWhatsNewVC;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
- (void)setChildViews:(id)a3;
@end

@implementation _TVDescriptiveAlertViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVDescriptiveAlertView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_TVDescriptiveAlertView" hasInstanceVariable:@"_viewsAboveScrollView" withType:"NSArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVDescriptiveAlertView", @"setChildViews:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVDescriptiveAlertView", @"layoutSubviews", "v", 0);
}

- (BOOL)_axIsInTVWhatsNewVC
{
  v2 = [(_TVDescriptiveAlertViewAccessibility *)self _accessibilityFindAncestor:&__block_literal_global_3 startWithSelf:1];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)_TVDescriptiveAlertViewAccessibility;
  [(_TVDescriptiveAlertViewAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  BOOL v3 = [(_TVDescriptiveAlertViewAccessibility *)self safeValueForKey:@"_viewsAboveScrollView"];
  v4 = __UIAccessibilityCastAsClass();

  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    uint64_t v9 = *MEMORY[0x263F1CEF8];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        NSClassFromString(&cfstr_Tvlabel.isa);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v11, "setAccessibilityTraits:", v9, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)setChildViews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_TVDescriptiveAlertViewAccessibility;
  [(_TVDescriptiveAlertViewAccessibility *)&v4 setChildViews:a3];
  [(_TVDescriptiveAlertViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_TVDescriptiveAlertViewAccessibility;
  [(_TVDescriptiveAlertViewAccessibility *)&v4 layoutSubviews];
  if ([(_TVDescriptiveAlertViewAccessibility *)self _axIsInTVWhatsNewVC])
  {
    BOOL v3 = [(_TVDescriptiveAlertViewAccessibility *)self _accessibilityDescendantOfType:NSClassFromString(&cfstr_Tvbutton.isa)];
    UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], v3);
  }
}

@end