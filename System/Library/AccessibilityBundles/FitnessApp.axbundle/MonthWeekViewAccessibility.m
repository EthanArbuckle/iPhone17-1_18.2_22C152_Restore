@interface MonthWeekViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation MonthWeekViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MonthWeekView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKCalendarWeekView", @"monthTitleView", "@", 0);
  [v3 validateClass:@"MonthWeekView" isKindOfClass:@"HKCalendarWeekView"];
}

- (id)accessibilityElements
{
  id v3 = +[NSMutableArray array];
  v4 = [(MonthWeekViewAccessibility *)self layer];
  v5 = [v4 sublayers];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        AXSafeClassFromString();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v11, "setAccessibilityContainer:", self, (void)v16);
          [v3 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v12 = +[NSMutableArray array];
  v13 = [(MonthWeekViewAccessibility *)self safeValueForKey:@"monthTitleView"];
  [v12 axSafelyAddObject:v13];
  if (v3) {
    [v12 addObjectsFromArray:v3];
  }
  v14 = objc_msgSend(v12, "sortedArrayUsingSelector:", "accessibilityCompareGeometry:", (void)v16);

  return v14;
}

@end