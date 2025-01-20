@interface NUIContainerStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)canBecomeFocused;
- (id)_axVisibleViews;
- (id)accessibilityLabel;
@end

@implementation NUIContainerStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NUIContainerStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NUIContainerStackView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NUIContainerView", @"visibleArrangedSubviews", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(NUIContainerStackViewAccessibility *)self _axVisibleViews];
  id v3 = MEMORY[0x245650570]();

  return v3;
}

- (id)_axVisibleViews
{
  objc_opt_class();
  id v3 = [(NUIContainerStackViewAccessibility *)self safeValueForKey:@"visibleArrangedSubviews"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

- (BOOL)canBecomeFocused
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  id v3 = [v2 gestureRecognizers];

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
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

@end