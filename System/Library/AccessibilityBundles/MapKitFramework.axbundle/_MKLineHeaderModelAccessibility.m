@interface _MKLineHeaderModelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)contentAttributedString;
@end

@implementation _MKLineHeaderModelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MKLineHeaderModel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKLineHeaderModel", @"contentAttributedString", "@", 0);
  [v3 validateClass:@"_MKLineHeaderModel" hasInstanceVariable:@"_tokens" withType:"NSMutableArray"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKTokenAttributedString", @"attributedString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"_MKTokenAttributedString", @"string", "@", 0);
}

- (id)contentAttributedString
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)_MKLineHeaderModelAccessibility;
  uint64_t v4 = [(_MKLineHeaderModelAccessibility *)&v29 contentAttributedString];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_opt_class();
  v5 = [(_MKLineHeaderModelAccessibility *)self safeValueForKey:@"_tokens"];
  v6 = __UIAccessibilityCastAsClass();

  v24 = (void *)v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v7)
  {
    v9 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = v7;
  v9 = 0;
  uint64_t v10 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      objc_opt_class();
      v13 = [v12 safeValueForKey:@"attributedString"];
      v14 = __UIAccessibilityCastAsClass();

      if (!v14)
      {
        objc_opt_class();
        v19 = [v12 safeValueForKey:@"string"];
        v15 = __UIAccessibilityCastAsClass();

        uint64_t v20 = [v15 accessibilityLabel];
        v18 = (void *)v20;
        if (v20) {
          uint64_t v21 = v20;
        }
        else {
          uint64_t v21 = (uint64_t)v15;
        }
        v23 = (void *)v21;
        uint64_t v17 = __UIAXStringForVariables();

LABEL_15:
        v9 = (void *)v17;
        goto LABEL_16;
      }
      v15 = [v14 accessibilityLabel];
      uint64_t v16 = (uint64_t)v15;
      if (!v15)
      {
        uint64_t v2 = [v14 string];
        uint64_t v16 = v2;
      }
      v23 = (void *)v16;
      uint64_t v17 = __UIAXStringForVariables();

      v18 = (void *)v2;
      v9 = (void *)v17;
      if (!v15) {
        goto LABEL_15;
      }
LABEL_16:
    }
    uint64_t v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16, v23, @"__AXStringForVariablesSentinel");
  }
  while (v8);
LABEL_20:

  [v24 setAccessibilityLabel:v9];

  return v24;
}

@end