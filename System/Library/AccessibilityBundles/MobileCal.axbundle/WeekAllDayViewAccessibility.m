@interface WeekAllDayViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
- (void)setOccurrences:(id)a3 animated:(BOOL)a4;
@end

@implementation WeekAllDayViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"WeekAllDayView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"_dayWidth", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"firstEventYOffset", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"_dayIndexForToday", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"WeekAllDayView", @"setOccurrences:animated:", "v", "@", "B", 0);
  [v3 validateClass:@"WeekAllDayView" hasInstanceVariable:@"_dayStarts" withType:"NSArray"];
  [v3 validateClass:@"WeekAllDayView" hasInstanceVariable:@"_layedOutRows" withType:"NSMutableArray"];
}

- (void)setOccurrences:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WeekAllDayViewAccessibility;
  [(WeekAllDayViewAccessibility *)&v5 setOccurrences:a3 animated:a4];
  [(WeekAllDayViewAccessibility *)self _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];
}

- (id)accessibilityElements
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v3 = [(WeekAllDayViewAccessibility *)self _accessibilityValueForKey:*MEMORY[0x263F81490]];
  if (!v3)
  {
    v44 = self;
    v4 = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"_dayStarts"];
    unint64_t v5 = [v4 count];
    id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:v5];
    v43 = v4;
    if (v5)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        v7 = [[WeekAllDayDayContainerAccessibilityElement alloc] initWithAccessibilityContainer:self];
        [(WeekAllDayDayContainerAccessibilityElement *)v7 setDayIndex:i];
        v8 = [v4 objectAtIndex:i];
        v9 = [v8 date];
        [(WeekAllDayDayContainerAccessibilityElement *)v7 setDate:v9];

        [(WeekAllDayDayContainerAccessibilityElement *)v7 setAllDayView:self];
        [v3 addObject:v7];
      }
      if (v5 > 1)
      {
        v10 = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"_dayWidth"];
        [v10 doubleValue];

        v11 = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"bounds"];
        [v11 CGRectValue];

        v12 = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"firstEventYOffset"];
        [v12 doubleValue];

        v13 = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"_dayIndexForToday"];
        uint64_t v48 = [v13 integerValue];

        for (uint64_t j = 0; j != v5; ++j)
        {
          v15 = [v3 objectAtIndex:j];
          v16 = [v4 objectAtIndex:j];
          v17 = [[WeekAllDayLabelAccessibilityElement alloc] initWithAccessibilityContainer:v15];
          v18 = [v16 date];
          v19 = _AXGetStringsForDate(v18);
          [(WeekAllDayLabelAccessibilityElement *)v17 setAccessibilityLabel:v19];

          if (v48 == j)
          {
            v20 = accessibilityLocalizedString(@"today.indicator");
            v21 = [(WeekAllDayLabelAccessibilityElement *)v17 accessibilityLabel];
            v22 = __UIAXStringForVariables();
            [(WeekAllDayLabelAccessibilityElement *)v17 setAccessibilityLabel:v22, v21, @"__AXStringForVariablesSentinel"];
          }
          if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy())
          {
            [v16 day];
            v23 = AXFormatInteger();
          }
          else
          {
            v24 = [v16 date];
            v23 = MEMORY[0x245654920]();
          }
          v25 = (void *)MEMORY[0x263EFF8C0];
          v26 = [(WeekAllDayLabelAccessibilityElement *)v17 accessibilityLabel];
          v27 = objc_msgSend(v25, "axArrayByIgnoringNilElementsWithCount:", 2, v23, v26);
          [(WeekAllDayLabelAccessibilityElement *)v17 setAccessibilityUserInputLabels:v27];

          [(WeekAllDayLabelAccessibilityElement *)v17 setDayIndex:j];
          [(WeekAllDayLabelAccessibilityElement *)v17 setAllDayView:self];
          v28 = [v15 children];
          [v28 addObject:v17];

          v4 = v43;
        }
      }
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    obuint64_t j = [(WeekAllDayViewAccessibility *)self safeValueForKey:@"_layedOutRows"];
    uint64_t v47 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v55;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v55 != v46) {
            objc_enumerationMutation(obj);
          }
          uint64_t v49 = v29;
          v30 = *(void **)(*((void *)&v54 + 1) + 8 * v29);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v31 = [v30 safeValueForKey:@"occurrenceBlocks"];
          uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
          if (v32)
          {
            uint64_t v33 = v32;
            uint64_t v34 = *(void *)v51;
            do
            {
              for (uint64_t k = 0; k != v33; ++k)
              {
                if (*(void *)v51 != v34) {
                  objc_enumerationMutation(v31);
                }
                v36 = *(void **)(*((void *)&v50 + 1) + 8 * k);
                v37 = [v36 safeValueForKey:@"occurrenceView"];
                v38 = [v36 safeValueForKey:@"rangeStart"];
                uint64_t v39 = [v38 integerValue];

                v40 = [v3 objectAtIndex:v39];
                v41 = [v40 children];
                [v41 addObject:v37];

                [v37 setAccessibilityContainer:v40];
              }
              uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v58 count:16];
            }
            while (v33);
          }

          uint64_t v29 = v49 + 1;
        }
        while (v49 + 1 != v47);
        uint64_t v47 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v47);
    }

    [(WeekAllDayViewAccessibility *)v44 _accessibilitySetRetainedValue:v3 forKey:*MEMORY[0x263F81490]];
  }

  return v3;
}

@end