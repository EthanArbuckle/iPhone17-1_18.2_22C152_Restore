@interface CardViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
- (int64_t)accessibilityContainerType;
@end

@implementation CardViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Diagnostics.CardViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.CardViewCell", @"stackView", "@", 0);
  [v3 validateClass:@"Diagnostics.CardStackSubviewContainer"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Diagnostics.CardStackSubviewContainer", @"containedView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityElements
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  char v20 = 0;
  objc_opt_class();
  id v3 = [(CardViewCellAccessibility *)self safeValueForKey:@"stackView"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v15 = v4;
  v6 = [v4 arrangedSubviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        MEMORY[0x24564A5E0](@"Diagnostics.CardStackSubviewContainer");
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 safeValueForKey:@"containedView"];
          if (objc_opt_respondsToSelector())
          {
            v13 = [v12 subviewsForStackViewElement];
            [v5 axSafelyAddObjectsFromArray:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  return v5;
}

@end