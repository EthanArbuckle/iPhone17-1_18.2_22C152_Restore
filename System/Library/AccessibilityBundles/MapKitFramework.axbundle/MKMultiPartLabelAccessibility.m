@interface MKMultiPartLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MKMultiPartLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKMultiPartLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMultiPartLabel", @"text", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMultiPartLabel", @"multiPartString", "@", 0);
  [v3 validateClass:@"MKMultiPartAttributedString"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMultiPartAttributedString", @"components", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v18 = [(MKMultiPartLabelAccessibility *)self safeValueForKey:@"multiPartString"];
  if (!v18) {
    goto LABEL_14;
  }
  objc_opt_class();
  v2 = [v18 safeValueForKey:@"components"];
  id v3 = __UIAccessibilityCastAsClass();

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = &stru_26F6DE2F0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  id v5 = (id)[v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    uint64_t v7 = *MEMORY[0x263F1C208];
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 length];
          v19[0] = MEMORY[0x263EF8330];
          v19[1] = 3221225472;
          v19[2] = __51__MKMultiPartLabelAccessibility_accessibilityLabel__block_invoke;
          v19[3] = &unk_26512C440;
          v19[4] = &v24;
          objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v10, 0, v19);
          v15 = [v9 string];
          v16 = @"__AXStringForVariablesSentinel";
          uint64_t v11 = __UIAXStringForVariables();
          v12 = (void *)v25[5];
          v25[5] = v11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }
    while (v5);
  }

  uint64_t v13 = [(id)v25[5] length];
  if (v13) {
    id v5 = (id)v25[5];
  }
  _Block_object_dispose(&v24, 8);

  if (!v13)
  {
LABEL_14:
    id v5 = [(MKMultiPartLabelAccessibility *)self safeStringForKey:@"text", v15, v16];
  }

  return v5;
}

void __51__MKMultiPartLabelAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  NSClassFromString(&cfstr_Nstextattachme.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v7 accessibilityLabel];
    uint64_t v3 = __UIAXStringForVariables();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

@end