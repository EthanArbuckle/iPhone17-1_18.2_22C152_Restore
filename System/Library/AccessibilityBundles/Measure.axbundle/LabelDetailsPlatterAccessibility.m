@interface LabelDetailsPlatterAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axDidInitializeZeroAlpha;
- (BOOL)accessibilityPerformEscape;
- (BOOL)accessibilityViewIsModal;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateCloseButton;
- (void)_axSetDidInitializeZeroAlpha:(BOOL)a3;
- (void)didMoveToWindow;
- (void)setAlpha:(double)a3;
@end

@implementation LabelDetailsPlatterAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.LabelDetailsPlatter";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"Measure.LabelDetailsPlatter" isKindOfClass:@"UIView"];
  [v3 validateClass:@"Measure.LabelDetailsPlatter" isKindOfClass:@"Measure.GenericPlatter"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"setAlpha:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"didMoveToWindow", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.GenericPlatter", @"close", "v", 0);
}

- (void)_axAnnotateCloseButton
{
  id v3 = [(LabelDetailsPlatterAccessibility *)self _accessibilityFindDescendant:&__block_literal_global_0];
  [v3 setIsAccessibilityElement:1];
  [v3 setAccessibilityTraits:*MEMORY[0x263F1CEE8]];
  v2 = accessibilityLocalizedString(@"CLOSE_BUTTON");
  [v3 setAccessibilityLabel:v2];
}

uint64_t __58__LabelDetailsPlatterAccessibility__axAnnotateCloseButton__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
    id v3 = objc_msgSend(v2, "gestureRecognizers", 0, 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v4 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_axDidInitializeZeroAlpha
{
  return MEMORY[0x270F0A438](self, &__LabelDetailsPlatterAccessibility___axDidInitializeZeroAlpha);
}

- (void)_axSetDidInitializeZeroAlpha:(BOOL)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)LabelDetailsPlatterAccessibility;
  [(LabelDetailsPlatterAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(LabelDetailsPlatterAccessibility *)self _axAnnotateCloseButton];
  [(LabelDetailsPlatterAccessibility *)self _axSetDidInitializeZeroAlpha:1];
}

- (BOOL)accessibilityViewIsModal
{
  objc_opt_class();
  id v2 = __UIAccessibilityCastAsClass();
  [v2 alpha];
  BOOL v4 = v3 >= 1.0;

  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  if ([(LabelDetailsPlatterAccessibility *)self accessibilityViewIsModal])
  {
    id v3 = (id)[(LabelDetailsPlatterAccessibility *)self safeValueForKey:@"close"];
    return 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)LabelDetailsPlatterAccessibility;
    return [(LabelDetailsPlatterAccessibility *)&v5 accessibilityPerformEscape];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)LabelDetailsPlatterAccessibility;
  [(LabelDetailsPlatterAccessibility *)&v3 didMoveToWindow];
  [(LabelDetailsPlatterAccessibility *)self _axAnnotateCloseButton];
}

- (void)setAlpha:(double)a3
{
  char v10 = 0;
  objc_opt_class();
  objc_super v5 = __UIAccessibilityCastAsClass();
  [v5 alpha];
  double v7 = v6;
  v9.receiver = self;
  v9.super_class = (Class)LabelDetailsPlatterAccessibility;
  [(LabelDetailsPlatterAccessibility *)&v9 setAlpha:a3];
  [v5 alpha];
  if (vabdd_f64(v7, v8) >= 2.22044605e-16)
  {
    if ([(LabelDetailsPlatterAccessibility *)self _axDidInitializeZeroAlpha]) {
      UIAccessibilityPostNotification(*MEMORY[0x263F1CE68], 0);
    }
    else {
      [(LabelDetailsPlatterAccessibility *)self _axSetDidInitializeZeroAlpha:1];
    }
  }
}

@end