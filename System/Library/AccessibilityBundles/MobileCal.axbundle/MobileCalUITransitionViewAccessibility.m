@interface MobileCalUITransitionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation MobileCalUITransitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITransitionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AdaptiveSearchController"];
  [v3 validateClass:@"_UISearchBarContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITransitionView", @"delegate", "@", 0);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)MobileCalUITransitionViewAccessibility;
  id v3 = [(MobileCalUITransitionViewAccessibility *)&v22 _accessibilityObscuredScreenAllowedViews];
  char v21 = 0;
  objc_opt_class();
  v4 = [(MobileCalUITransitionViewAccessibility *)self safeValueForKey:@"delegate"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = [v5 presentedViewController];
  NSClassFromString(&cfstr_Adaptivesearch.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [(MobileCalUITransitionViewAccessibility *)self superview];
    v9 = [v8 subviews];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          NSClassFromString(&cfstr_Uisearchbarcon.isa);
          if (objc_opt_isKindOfClass())
          {
            if (v3)
            {
              uint64_t v15 = [v3 arrayByAddingObject:v14];

              id v3 = (void *)v15;
            }
            else
            {
              uint64_t v23 = v14;
              id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
            }
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }

  return v3;
}

@end