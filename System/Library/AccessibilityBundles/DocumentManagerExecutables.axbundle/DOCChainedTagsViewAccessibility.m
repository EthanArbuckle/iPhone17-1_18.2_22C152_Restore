@interface DOCChainedTagsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation DOCChainedTagsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"DOCChainedTagsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(DOCChainedTagsViewAccessibility *)self safeArrayForKey:@"tags"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      v8 = v5;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v7), "displayName", v10, v11);
        v11 = @"__AXStringForVariablesSentinel";
        v5 = __UIAXStringForVariables();

        ++v7;
        v8 = v5;
      }
      while (v4 != v7);
      uint64_t v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16, v10, @"__AXStringForVariablesSentinel");
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end