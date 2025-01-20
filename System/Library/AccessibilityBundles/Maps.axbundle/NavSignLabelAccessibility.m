@interface NavSignLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityAttributedLabel;
- (id)accessibilityAttributedUserInputLabels;
@end

@implementation NavSignLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NavSignLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NavSignLabel", @"textAlternatives", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKServerFormattedString", @"multiPartAttributedStringWithAttributes:", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MKMultiPartAttributedString", @"attributedString", "@", 0);
}

- (id)accessibilityAttributedLabel
{
  v2 = [(NavSignLabelAccessibility *)self safeArrayForKey:@"textAlternatives"];
  LOBYTE(v9) = 0;
  id v3 = [v2 firstObject];
  v4 = __UIAccessibilitySafeClass();

  char v15 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  id v5 = v4;
  AXPerformSafeBlock();
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  v7 = __UIAccessibilitySafeClass();

  if (v15) {
    abort();
  }

  return v7;
}

void __57__NavSignLabelAccessibility_accessibilityAttributedLabel__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) multiPartAttributedStringWithAttributes:MEMORY[0x263EFFA78]];
  uint64_t v2 = [v5 attributedString];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)accessibilityAttributedUserInputLabels
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(NavSignLabelAccessibility *)self safeArrayForKey:@"textAlternatives"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        LOBYTE(v13) = 0;
        id v6 = __UIAccessibilitySafeClass();
        if ((_BYTE)v13) {
          abort();
        }
        char v19 = 0;
        uint64_t v13 = 0;
        id v14 = &v13;
        uint64_t v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__0;
        v17 = __Block_byref_object_dispose__0;
        id v18 = 0;
        id v7 = v6;
        AXPerformSafeBlock();
        id v8 = (id)v14[5];

        _Block_object_dispose(&v13, 8);
        uint64_t v9 = __UIAccessibilitySafeClass();

        if (v19) {
          abort();
        }
        [v12 axSafelyAddObject:v9];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }

  return v12;
}

void __67__NavSignLabelAccessibility_accessibilityAttributedUserInputLabels__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) multiPartAttributedStringWithAttributes:MEMORY[0x263EFFA78]];
  uint64_t v2 = [v5 attributedString];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end