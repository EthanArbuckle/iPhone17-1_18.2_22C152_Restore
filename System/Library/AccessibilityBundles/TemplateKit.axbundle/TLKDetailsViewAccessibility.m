@interface TLKDetailsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TLKDetailsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKDetailsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TLKTitleContainerView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDetailsView", @"titleContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTitleContainerView", @"titleLabelString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKTitleContainerView", @"secondaryLabel", "@", 0);
  [v3 validateClass:@"TLKDetailsView" hasProperty:@"contentView" withType:"@"];
  [v3 validateClass:@"TLKTextAreaView" hasProperty:@"detailsFields" withType:"@"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"TLKDetailsView", @"footnoteLabel", "@", 0);
}

- (id)accessibilityLabel
{
  v2 = [(TLKDetailsViewAccessibility *)self safeValueForKey:@"titleContainer"];
  id v3 = [v2 safeStringForKey:@"titleLabelString"];
  v4 = [v2 safeUIViewForKey:@"secondaryLabel"];
  if ([v4 _accessibilityViewIsVisible])
  {
    v7 = [v4 accessibilityLabel];
    v5 = __UIAXStringForVariables();
  }
  else
  {
    v5 = __UIAXStringForVariables();
  }

  return v5;
}

- (id)accessibilityValue
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = [(TLKDetailsViewAccessibility *)self safeValueForKey:@"contentView"];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  char v20 = 0;
  objc_opt_class();
  v4 = [v2 safeValueForKey:@"detailsFields"];
  v5 = __UIAccessibilityCastAsClass();

  v6 = (void *)[v5 mutableCopy];
  v7 = [v2 safeValueForKey:@"footnoteLabel"];
  [v6 axSafelyAddObject:v7];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "_accessibilityViewIsVisible", (void)v16)) {
          [v3 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v10);
  }

  v14 = MEMORY[0x245666DB0](v3);

  return v14;
}

@end