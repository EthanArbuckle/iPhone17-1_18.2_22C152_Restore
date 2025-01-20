@interface MPUMarqueeViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MPUMarqueeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPUMarqueeView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  v3 = [(MPUMarqueeViewAccessibility *)self storedIsAccessibilityElement];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 BOOLValue];
  }
  else
  {
    v6 = [(MPUMarqueeViewAccessibility *)self accessibilityLabel];
    char v5 = [v6 length] != 0;
  }
  return v5;
}

- (id)accessibilityLabel
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [(MPUMarqueeViewAccessibility *)self safeValueForKey:@"contentView"];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [v2 subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    v7 = &stru_26F4162A0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v9 accessibilityLabel];
          uint64_t v10 = __UIAXStringForVariables();

          v7 = (__CFString *)v10;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    v7 = &stru_26F4162A0;
  }

  return v7;
}

@end