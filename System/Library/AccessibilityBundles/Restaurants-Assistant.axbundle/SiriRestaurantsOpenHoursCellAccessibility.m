@interface SiriRestaurantsOpenHoursCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)configureWithParsedOpenHoursInfo:(id)a3;
@end

@implementation SiriRestaurantsOpenHoursCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SiriRestaurantsOpenHoursCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)configureWithParsedOpenHoursInfo:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SiriRestaurantsOpenHoursCellAccessibility;
  [(SiriRestaurantsOpenHoursCellAccessibility *)&v9 configureWithParsedOpenHoursInfo:a3];
  v4 = [(SiriRestaurantsOpenHoursCellAccessibility *)self safeValueForKey:@"_dayRangeLabels"];
  v5 = [(SiriRestaurantsOpenHoursCellAccessibility *)self safeValueForKey:@"_hoursLabelPerRange"];
  if ([v4 count])
  {
    uint64_t v6 = [v4 count];
    if (v6 == [v5 count])
    {
      id v7 = v4;
      id v8 = v5;
      AXPerformSafeBlock();
    }
  }
}

void __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_2;
  v2[3] = &unk_26514A378;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateObjectsUsingBlock:v2];
}

void __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 objectAtIndex:a3];
  if ([v6 count] == 2)
  {
    id v7 = NSString;
    id v8 = restaurantAccessibilityLocalizedString(@"daterange.join");
    objc_super v9 = [v6 lastObject];
    v10 = [v9 accessibilityLabel];
    v11 = [v6 firstObject];
    v12 = [v11 accessibilityLabel];
    objc_msgSend(v7, "stringWithFormat:", v8, v10, v12);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
  [v6 enumerateObjectsUsingBlock:&__block_literal_global_1];
  v13 = [v5 accessibilityLabel];
  v14 = __UIAXStringForVariables();
  objc_msgSend(v5, "setAccessibilityLabel:", v14, v15, @"__AXStringForVariablesSentinel");
}

uint64_t __78__SiriRestaurantsOpenHoursCellAccessibility_configureWithParsedOpenHoursInfo___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setIsAccessibilityElement:0];
}

@end