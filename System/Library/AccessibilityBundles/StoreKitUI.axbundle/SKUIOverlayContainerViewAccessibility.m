@interface SKUIOverlayContainerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)accessibilityElements;
@end

@implementation SKUIOverlayContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIOverlayContainerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  v3 = [(SKUIOverlayContainerViewAccessibility *)self _accessibilityValueForKey:@"Backstop"];
  if (!v3)
  {
    v3 = [[StoreBackstopAccessibilityElement alloc] initWithAccessibilityContainer:self];
    v4 = UIKitAccessibilityLocalizedString();
    [(StoreBackstopAccessibilityElement *)v3 setAccessibilityLabel:v4];

    v5 = UIKitAccessibilityLocalizedString();
    [(StoreBackstopAccessibilityElement *)v3 setAccessibilityHint:v5];

    [(SKUIOverlayContainerViewAccessibility *)self _accessibilitySetRetainedValue:v3 forKey:@"Backstop"];
  }
  v6 = [(SKUIOverlayContainerViewAccessibility *)self subviews];
  v7 = [v6 arrayByAddingObject:v3];

  return v7;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = [(SKUIOverlayContainerViewAccessibility *)self accessibilityIdentifier];
  int v4 = [v3 isEqualToString:@"OverlayCaptureView"];

  if (v4)
  {
    char v23 = 0;
    objc_opt_class();
    v5 = __UIAccessibilityCastAsClass();
    v6 = [v5 superview];
    v7 = [v6 subviews];

    v8 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = [v14 accessibilityIdentifier];
          int v16 = [v15 isEqualToString:@"FloatingPreview"];

          if (v16) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {

      goto LABEL_15;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIOverlayContainerViewAccessibility;
  v8 = [(SKUIOverlayContainerViewAccessibility *)&v18 _accessibilityObscuredScreenAllowedViews];
LABEL_15:

  return v8;
}

@end