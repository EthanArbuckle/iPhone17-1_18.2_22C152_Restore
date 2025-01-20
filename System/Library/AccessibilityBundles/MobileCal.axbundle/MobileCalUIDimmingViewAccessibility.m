@interface MobileCalUIDimmingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityObscuredScreenAllowedViews;
@end

@implementation MobileCalUIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"LargeWeekViewController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIDimmingView", @"delegate", "@", 0);
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  v13.receiver = self;
  v13.super_class = (Class)MobileCalUIDimmingViewAccessibility;
  id v3 = [(MobileCalUIDimmingViewAccessibility *)&v13 _accessibilityObscuredScreenAllowedViews];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(MobileCalUIDimmingViewAccessibility *)self safeValueForKey:@"delegate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 delegate];
    NSClassFromString(&cfstr_Largeweekviewc_0.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = [v4 count];
      if (v8 - 1 >= 0)
      {
        uint64_t v9 = v8;
        do
        {
          v10 = [v4 objectAtIndexedSubscript:--v9];
          objc_opt_class();
          char v11 = objc_opt_isKindOfClass();

          if (v11) {
            [v4 removeObjectAtIndex:v9];
          }
        }
        while (v9 > 0);
      }
    }
  }

  return v4;
}

@end