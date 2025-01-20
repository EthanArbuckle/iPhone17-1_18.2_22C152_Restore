@interface EKDayViewContentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6;
@end

@implementation EKDayViewContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"EKDayViewContent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"EKDayViewContent", @"applyLoadedOccurrencesWithBatching:animated:reverse:completion:", "v", "B", "B", "B", "@?", 0);
  [v3 validateClass:@"EKDayViewContent" hasInstanceVariable:@"_itemsByDay" withType:"NSMutableArray"];
  [v3 validateClass:@"EKDayViewContent" hasInstanceVariable:@"_grid" withType:"EKDayGridView"];
}

- (void)applyLoadedOccurrencesWithBatching:(BOOL)a3 animated:(BOOL)a4 reverse:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  v11 = [(EKDayViewContentAccessibility *)self safeValueForKey:@"_grid"];
  [v11 _accessibilityRemoveValueForKey:*MEMORY[0x263F81490]];

  v12.receiver = self;
  v12.super_class = (Class)EKDayViewContentAccessibility;
  [(EKDayViewContentAccessibility *)&v12 applyLoadedOccurrencesWithBatching:v8 animated:v7 reverse:v6 completion:v10];

  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)EKDayViewContentAccessibility;
  [(EKDayViewContentAccessibility *)&v22 _accessibilityLoadAccessibilityInformation];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = [(EKDayViewContentAccessibility *)self safeValueForKey:@"_itemsByDay"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v15;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v15 != v12) {
                objc_enumerationMutation(v9);
              }
              [*(id *)(*((void *)&v14 + 1) + 8 * v13++) _accessibilityLoadAccessibilityInformation];
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v23 count:16];
          }
          while (v11);
        }

        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }
}

@end