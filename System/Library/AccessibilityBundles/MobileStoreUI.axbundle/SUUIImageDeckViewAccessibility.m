@interface SUUIImageDeckViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation SUUIImageDeckViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIImageDeckView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(SUUIImageDeckViewAccessibility *)self safeValueForKey:@"_imageViews"];
  v3 = __UIAccessibilitySafeClass();

  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    v7 = &stru_26F7296D0;
    do
    {
      uint64_t v8 = 0;
      v9 = v7;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "accessibilityLabel", v14, v15);
        v15 = @"__AXStringForVariablesSentinel";
        __UIAXStringForVariables();
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v7;
      }
      while (v5 != v8);
      uint64_t v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v14, @"__AXStringForVariablesSentinel");
    }
    while (v5);
  }
  else
  {
    v7 = &stru_26F7296D0;
  }

  if ([(__CFString *)v7 length])
  {
    v10 = NSString;
    v11 = accessibilityLocalizedString(@"collection.deck.album.labels");
    v12 = objc_msgSend(v10, "stringWithFormat:", v11, v7);
  }
  else
  {
    v12 = accessibilityLocalizedString(@"collection.deck.no.album.labels");
  }

  return v12;
}

@end