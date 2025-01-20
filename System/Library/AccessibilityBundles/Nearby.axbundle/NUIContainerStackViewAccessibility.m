@interface NUIContainerStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axArrangedSubviews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
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

- (id)_axArrangedSubviews
{
  objc_opt_class();
  v3 = [(NUIContainerStackViewAccessibility *)self safeValueForKey:@"_arrangedSubviews"];
  v4 = __UIAccessibilityCastAsClass();

  return v4;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  v2 = [(NUIContainerStackViewAccessibility *)self _axArrangedSubviews];
  BOOL v3 = [v2 count] == 2;

  return v3;
}

- (id)accessibilityLabel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v3 = [(NUIContainerStackViewAccessibility *)self _axArrangedSubviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        MEMORY[0x2456590E0](@"UILabel");
        if (objc_opt_isKindOfClass())
        {
          v9 = [v8 accessibilityLabel];

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)NUIContainerStackViewAccessibility;
  v9 = [(NUIContainerStackViewAccessibility *)&v11 accessibilityLabel];
LABEL_11:

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerStackViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(NUIContainerStackViewAccessibility *)&v3 accessibilityTraits];
}

@end