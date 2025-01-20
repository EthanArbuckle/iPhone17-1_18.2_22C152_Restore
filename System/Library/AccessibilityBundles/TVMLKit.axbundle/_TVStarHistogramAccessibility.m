@interface _TVStarHistogramAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAncestorFocusParcel;
- (id)accessibilityLabel;
@end

@implementation _TVStarHistogramAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStarHistogram";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStarHistogram", @"starBars", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStarBar", @"numStars", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_TVStarBar", @"countStr", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  char v39 = 0;
  objc_opt_class();
  id v3 = [(_TVStarHistogramAccessibility *)self safeValueForKey:@"starBars"];
  v4 = __UIAccessibilityCastAsClass();

  if ([v4 count])
  {
    v30 = v4;
    v31 = self;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v7 = 0;
      unint64_t v8 = 0x263F08000uLL;
      v9 = @"numStars";
      uint64_t v10 = *(void *)v36;
      do
      {
        uint64_t v11 = 0;
        uint64_t v32 = v6;
        do
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
          char v39 = 0;
          objc_opt_class();
          v13 = [v12 safeValueForKey:v9];
          v14 = __UIAccessibilityCastAsClass();

          if (v39
            || (char v39 = 0,
                objc_opt_class(),
                [v12 safeValueForKey:@"countStr"],
                v15 = objc_claimAutoreleasedReturnValue(),
                __UIAccessibilityCastAsClass(),
                v16 = objc_claimAutoreleasedReturnValue(),
                v15,
                v39))
          {
            abort();
          }
          if (v14) {
            BOOL v17 = v16 == 0;
          }
          else {
            BOOL v17 = 1;
          }
          if (!v17)
          {
            v18 = [v16 string];
            uint64_t v19 = [v18 integerValue];

            if (v19 >= 1)
            {
              v20 = NSString;
              accessibilityLocalizedString(@"star.histogram");
              uint64_t v21 = v10;
              v22 = v9;
              v24 = unint64_t v23 = v8;
              v28 = objc_msgSend(v20, "stringWithFormat:", v24, v19, objc_msgSend(v14, "integerValue"));
              v29 = @"__AXStringForVariablesSentinel";
              uint64_t v25 = __UIAXStringForVariables();

              unint64_t v8 = v23;
              v9 = v22;
              uint64_t v10 = v21;
              uint64_t v6 = v32;
              v7 = (void *)v25;
            }
          }

          ++v11;
        }
        while (v6 != v11);
        uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v4 = v30;
    self = v31;
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length", v28, v29))
  {
    v34.receiver = self;
    v34.super_class = (Class)_TVStarHistogramAccessibility;
    uint64_t v26 = [(_TVStarHistogramAccessibility *)&v34 accessibilityLabel];

    v7 = (void *)v26;
  }

  return v7;
}

- (id)_accessibilityAncestorFocusParcel
{
  id v3 = [MEMORY[0x263F22248] sharedInstance];
  char v4 = [v3 isProcessTVAppStore];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TVStarHistogramAccessibility;
    uint64_t v5 = [(_TVStarHistogramAccessibility *)&v7 _accessibilityAncestorFocusParcel];
  }

  return v5;
}

@end