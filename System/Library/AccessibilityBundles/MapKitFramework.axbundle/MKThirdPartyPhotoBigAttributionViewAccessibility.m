@interface MKThirdPartyPhotoBigAttributionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation MKThirdPartyPhotoBigAttributionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MKThirdPartyPhotoBigAttributionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MKThirdPartyPhotoBigAttributionView" hasInstanceVariable:@"_firstLineLabel" withType:"_MKUILabel"];
  [v3 validateClass:@"MKThirdPartyPhotoBigAttributionView" hasInstanceVariable:@"_secondLineLabel" withType:"_MKUILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(MKThirdPartyPhotoBigAttributionViewAccessibility *)self safeValueForKey:@"_firstLineLabel"];
  v4 = [v3 accessibilityLabel];

  char v18 = 0;
  objc_opt_class();
  v5 = [(MKThirdPartyPhotoBigAttributionViewAccessibility *)self safeValueForKey:@"_secondLineLabel"];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 attributedText];

  v8 = [v7 string];
  v9 = (void *)[v8 mutableCopy];

  v10 = [v7 attribute:@"AXAttributeDisplayName" atIndex:0 effectiveRange:0];
  if (v10)
  {
    uint64_t v11 = *MEMORY[0x263F1C208];
    uint64_t v12 = [v7 length];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __70__MKThirdPartyPhotoBigAttributionViewAccessibility_accessibilityLabel__block_invoke;
    v15[3] = &unk_26512C468;
    id v16 = v9;
    id v17 = v10;
    objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);
  }
  v13 = __UIAXStringForVariables();

  return v13;
}

uint64_t __70__MKThirdPartyPhotoBigAttributionViewAccessibility_accessibilityLabel__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a2)
  {
    result = objc_msgSend(*(id *)(result + 32), "replaceCharactersInRange:withString:", a3, a4, *(void *)(result + 40));
    *a5 = 1;
  }
  return result;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CF10];
}

@end