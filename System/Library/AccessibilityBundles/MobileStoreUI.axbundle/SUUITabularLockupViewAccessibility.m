@interface SUUITabularLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation SUUITabularLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUITabularLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SUUITabularLockupView" hasInstanceVariable:@"_layout" withType:"SUUITabularLockupLayout"];
  [v3 validateClass:@"SUUITabularLockupView" hasInstanceVariable:@"_viewElementViews" withType:"NSMapTable"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUITabularLockupLayout", @"columns", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SUUITabularLockupColumn", @"childViewElements", "@", 0);
}

- (id)accessibilityLabel
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  __int16 v49 = 0;
  id v3 = [(SUUITabularLockupViewAccessibility *)self safeValueForKey:@"_layout"];
  v4 = __UIAccessibilitySafeClass();

  v5 = [v4 safeValueForKey:@"columns"];
  v6 = __UIAccessibilitySafeClass();

  v7 = [(SUUITabularLockupViewAccessibility *)self safeValueForKey:@"_viewElementViews"];
  v8 = __UIAccessibilitySafeClass();

  v9 = [MEMORY[0x263EFF980] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    id v35 = *(id *)v46;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(id *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        __int16 v49 = 0;
        v13 = __UIAccessibilitySafeClass();
        if ((_BYTE)v49
          || (v14 = v13,
              [v13 safeValueForKey:@"childViewElements"],
              v15 = objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v16 = objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              HIBYTE(v49)))
        {
          abort();
        }
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v42;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v42 != v20) {
                objc_enumerationMutation(v17);
              }
              v22 = [v8 objectForKey:*(void *)(*((void *)&v41 + 1) + 8 * j)];
              NSClassFromString(&cfstr_Suuiattributed.isa);
              if (objc_opt_isKindOfClass()) {
                [v9 addObject:v22];
              }
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v51 count:16];
          }
          while (v19);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v11);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v36 = v9;
  uint64_t v23 = [v36 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    v25 = 0;
    uint64_t v26 = *(void *)v38;
    do
    {
      uint64_t v27 = 0;
      v28 = v25;
      do
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v36);
        }
        v29 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v27), "accessibilityLabel", v32, v33);
        v30 = [v29 stringByReplacingOccurrencesOfString:@"•" withString:@","];

        v32 = v30;
        v33 = @"__AXStringForVariablesSentinel";
        v25 = __UIAXStringForVariables();

        ++v27;
        v28 = v25;
      }
      while (v24 != v27);
      uint64_t v24 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v37, v50, 16, v30, @"__AXStringForVariablesSentinel");
    }
    while (v24);
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end