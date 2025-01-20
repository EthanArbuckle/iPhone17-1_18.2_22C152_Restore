@interface LabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (NSString)_accessibilityCurrentMeasurementString;
- (NSString)_accessibilityLastSavedMeasurementString;
- (id)_accessibilityLabelElementsWithAccessibilityContainer:(id)a3;
- (id)_axLabelElementForMeasureID:(id)a3 accessibilityContainer:(id)a4;
@end

@implementation LabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Measure.LabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelView", @"labels", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelRender", @"speakableString", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelRender", @"accessibilityFrameForLabelContainer", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelRender", @"state", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Measure.LabelRender", @"labelNode", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MeasureFoundation.WorldLine", @"identifiersOfObjectsComposedInto", "@", 0);
}

- (id)_axLabelElementForMeasureID:(id)a3 accessibilityContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v8 = [(LabelViewAccessibility *)self safeValueForKey:@"labels"];
  v9 = __UIAccessibilityCastAsClass();

  v10 = [v9 objectForKeyedSubscript:v6];
  v11 = v10;
  if (v10)
  {
    v12 = [v10 _accessibilityValueForKey:@"LabelRenderAXElement"];
    if (!v12)
    {
      v12 = [[AXMeasureLabelAccessibilityElement alloc] initWithAccessibilityContainer:v7];
      [(AXMeasureLabelAccessibilityElement *)v12 setLabelRender:v11];
      [v11 _accessibilitySetRetainedValue:v12 forKey:@"LabelRenderAXElement"];
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSString)_accessibilityLastSavedMeasurementString
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  id v3 = AXMeasureAccessibilityStateObserver();
  v4 = [v3 axOrderedWorldLineIDs];

  char v13 = 0;
  objc_opt_class();
  v5 = [(LabelViewAccessibility *)self safeValueForKey:@"labels"];
  id v6 = __UIAccessibilityCastAsClass();

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__LabelViewAccessibility__accessibilityLastSavedMeasurementString__block_invoke;
  v10[3] = &unk_26512F880;
  id v7 = v6;
  id v11 = v7;
  v12 = &v14;
  [v4 enumerateObjectsWithOptions:2 usingBlock:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return (NSString *)v8;
}

void __66__LabelViewAccessibility__accessibilityLastSavedMeasurementString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if ((unint64_t)([v9 safeIntegerForKey:@"state"] - 3) >= 2)
  {
    uint64_t v6 = [v9 safeStringForKey:@"speakableString"];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

- (NSString)_accessibilityCurrentMeasurementString
{
  id v3 = AXMeasureAccessibilityStateObserver();
  v4 = [v3 axOrderedWorldLineIDs];
  v5 = [v4 lastObject];

  objc_opt_class();
  uint64_t v6 = [(LabelViewAccessibility *)self safeValueForKey:@"labels"];
  uint64_t v7 = __UIAccessibilityCastAsClass();

  id v8 = [v7 objectForKeyedSubscript:v5];
  if ((unint64_t)([v8 safeIntegerForKey:@"state"] - 3) > 1)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v8 safeStringForKey:@"speakableString"];
  }

  return (NSString *)v9;
}

- (id)_accessibilityLabelElementsWithAccessibilityContainer:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v21 = [MEMORY[0x263EFF980] array];
  v20 = AXMeasureAccessibilityStateObserver();
  [v20 axOrderedWorldLineIDs];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        v10 = v7;
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v12 = [v20 axWorldLines];
        char v13 = [v12 objectForKeyedSubscript:v11];

        uint64_t v14 = [v13 safeArrayForKey:@"identifiersOfObjectsComposedInto"];
        uint64_t v7 = [v14 firstObject];

        if (v10 && ([v10 isEqual:v7] & 1) == 0)
        {
          v15 = [(LabelViewAccessibility *)self _axLabelElementForMeasureID:v10 accessibilityContainer:v4];
          [v15 setIsRectangleArea:1];
          [v21 axSafelyAddObject:v15];
        }
        uint64_t v16 = [(LabelViewAccessibility *)self _axLabelElementForMeasureID:v11 accessibilityContainer:v4];
        [v16 setIsRectangleSideLength:v7 != 0];
        [v21 axSafelyAddObject:v16];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
    if (v7)
    {
      v17 = [(LabelViewAccessibility *)self _axLabelElementForMeasureID:v7 accessibilityContainer:v4];
      [v17 setIsRectangleArea:1];
      [v21 axSafelyAddObject:v17];
    }
  }

  return v21;
}

@end