@interface MKPlaceAttributionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MKPlaceAttributionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKPlaceAttributionCell";
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
  LOBYTE(v16) = 0;
  objc_opt_class();
  v3 = [(MKPlaceAttributionCellAccessibility *)self safeValueForKey:@"_label"];
  v4 = __UIAccessibilityCastAsClass();

  if (!v4) {
    goto LABEL_9;
  }
  v5 = [v4 attributedText];
  v6 = (void *)[v5 copy];

  if (![v6 length])
  {
LABEL_8:

LABEL_9:
    v11 = [v4 accessibilityLabel];
    goto LABEL_10;
  }
  v7 = [v6 attribute:@"AXAttributeDisplayName" atIndex:0 effectiveRange:0];
  if (![v7 length])
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3010000000;
  v19 = &unk_24223277A;
  long long v20 = xmmword_242231E00;
  uint64_t v8 = [v6 length];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__MKPlaceAttributionCellAccessibility_accessibilityLabel__block_invoke;
  v15[3] = &unk_26512C490;
  v15[4] = &v16;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v15);
  uint64_t v9 = v17[4];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v10 = v17[5], v10 + v9 > (unint64_t)[v6 length]))
  {
    _Block_object_dispose(&v16, 8);
    goto LABEL_7;
  }
  v13 = [v6 string];
  v14 = (void *)[v13 copy];

  v11 = objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v17[4], v17[5], v7);

  _Block_object_dispose(&v16, 8);
LABEL_10:

  return v11;
}

void __57__MKPlaceAttributionCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v9 = [a2 objectForKey:*MEMORY[0x263F1C208]];

  if (v9)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    *a5 = 1;
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end