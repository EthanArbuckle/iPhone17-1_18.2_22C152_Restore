@interface CalendarMonthControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityUpdateOcurrenceTileCount:(id)a3;
@end

@implementation CalendarMonthControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CalendarMonthControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityUpdateOcurrenceTileCount:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v13 = self;
  [(CalendarMonthControlAccessibility *)self safeValueForKey:@"_accessibleSubviews"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * v7);
        NSClassFromString(&cfstr_Calendarmonthd.isa);
        if (objc_opt_isKindOfClass())
        {
          if (([v4 _accessibilityBoolValueForKey:@"_axDidWaitForLoad"] & 1) == 0)
          {
            [v4 _accessibilitySetBoolValue:1 forKey:@"_axDidWaitForLoad"];
            if (_accessibilityUpdateOcurrenceTileCount__onceToken != -1) {
              dispatch_once(&_accessibilityUpdateOcurrenceTileCount__onceToken, &__block_literal_global_0);
            }
            v9 = _accessibilityUpdateOcurrenceTileCount__WaitQueue;
            if (_accessibilityUpdateOcurrenceTileCount__WaitQueue)
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_2;
              block[3] = &unk_265131DF8;
              id v22 = v4;
              v23 = v13;
              dispatch_async(v9, block);
            }
          }
          v10 = [MEMORY[0x263EFF910] date];
          v11 = _AXDateComponentsFromDate(v10);

          uint64_t v17 = 0;
          v18 = &v17;
          uint64_t v19 = 0x2020000000;
          uint64_t v20 = 0;
          id v15 = v4;
          id v16 = v11;
          AXPerformSafeBlock();
          v12 = [NSNumber numberWithInteger:v18[3]];
          [v8 _accessibilitySetRetainedValue:v12 forKey:@"numberEvents"];

          _Block_object_dispose(&v17, 8);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }
}

uint64_t __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke()
{
  _accessibilityUpdateOcurrenceTileCount__WaitQueue = (uint64_t)dispatch_queue_create("ax-wait-cal", 0);

  return MEMORY[0x270F9A758]();
}

void __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_eventLoader"];
  id v3 = (id)[v2 safeValueForKey:@"waitForBackgroundLoad"];

  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accessibilityUpdateOcurrenceTileCount:*(void *)(a1 + 40)];
}

void __76__CalendarMonthControlAccessibility__accessibilityUpdateOcurrenceTileCount___block_invoke_4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) occurrencesForDay:*(void *)(a1 + 40) waitForLoad:*(unsigned __int8 *)(a1 + 56)];
  v2 = [v3 safeValueForKey:@"occurrences"];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count];
}

@end