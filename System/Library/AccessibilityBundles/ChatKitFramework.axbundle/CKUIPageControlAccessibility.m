@interface CKUIPageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
@end

@implementation CKUIPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  v12.receiver = self;
  v12.super_class = (Class)CKUIPageControlAccessibility;
  v3 = [(CKUIPageControlAccessibility *)&v12 accessibilityValue];
  v4 = [(CKUIPageControlAccessibility *)self accessibilityIdentification];
  int v5 = [v4 isEqualToString:@"AXImpactEffectPageControl"];

  if (v5)
  {
    v6 = [(CKUIPageControlAccessibility *)self _accessibilityValueForKey:@"AXImpactEffectPageControlValues"];
    v7 = [(CKUIPageControlAccessibility *)self safeValueForKey:@"currentPage"];
    unint64_t v8 = [v7 integerValue];

    if (v8 < [v6 count])
    {
      v11 = [v6 objectAtIndex:v8];
      uint64_t v9 = __AXStringForVariables();

      v3 = (void *)v9;
    }
  }

  return v3;
}

@end