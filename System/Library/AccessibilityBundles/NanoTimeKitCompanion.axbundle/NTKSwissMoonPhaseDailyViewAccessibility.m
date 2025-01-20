@interface NTKSwissMoonPhaseDailyViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation NTKSwissMoonPhaseDailyViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKSwissMoonPhaseDailyView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKSwissMoonPhaseDailyView", @"dayLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKSwissMoonPhaseDailyView", @"moonView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(NTKSwissMoonPhaseDailyViewAccessibility *)self safeValueForKey:@"dayLabel"];
  v4 = [v3 accessibilityLabel];

  id v5 = objc_alloc_init((Class)NSNumberFormatter);
  v6 = [v5 numberFromString:v4];
  if (v6)
  {
    v7 = +[NSDate date];
    v8 = +[NSCalendar currentCalendar];
    v9 = [v8 components:28 fromDate:v7];
    id v10 = [v6 integerValue];
    if ((uint64_t)v10 < (uint64_t)[v9 valueForComponent:16])
    {
      v11 = [v8 dateByAddingUnit:8 value:1 toDate:v7 options:0];
      uint64_t v12 = [v8 components:28 fromDate:v11];

      v9 = (void *)v12;
    }
    objc_msgSend(v9, "setDay:", objc_msgSend(v6, "integerValue"));
    v13 = [v8 dateFromComponents:v9];
    if (v13)
    {
      uint64_t v14 = AXDateStringForFormat();

      v4 = (void *)v14;
    }
  }
  v15 = [(NTKSwissMoonPhaseDailyViewAccessibility *)self safeValueForKey:@"moonView"];
  v16 = [v15 accessibilityLabel];

  if (v4 && v16)
  {
    uint64_t v17 = __UIAXStringForVariables();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)NTKSwissMoonPhaseDailyViewAccessibility;
    uint64_t v17 = [(NTKSwissMoonPhaseDailyViewAccessibility *)&v20 accessibilityLabel];
  }
  v18 = (void *)v17;

  return v18;
}

@end