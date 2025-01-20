@interface FMR1DistanceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityStringForDirectionView;
@end

@implementation FMR1DistanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FMFindingUI.FMR1DistanceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMR1DistanceView", @"accessibilityDistanceLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FMFindingUI.FMR1DistanceView", @"accessibilityDirectionLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  v2 = [(FMR1DistanceViewAccessibility *)self _accessibilityStringForDirectionView];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_accessibilityStringForDirectionView
{
  BOOL v3 = [(FMR1DistanceViewAccessibility *)self safeValueForKey:@"accessibilityDistanceLabel"];
  v4 = [(FMR1DistanceViewAccessibility *)self safeValueForKey:@"accessibilityDirectionLabel"];
  v5 = [NSString string];
  if (v3)
  {
    uint64_t v6 = [v3 accessibilityLabel];
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v8 = [v5 stringByAppendingString:v6];

      v5 = (void *)v8;
    }
  }
  if (v4)
  {
    uint64_t v9 = [v4 accessibilityLabel];
    if (v9)
    {
      v10 = (void *)v9;
      uint64_t v11 = [v5 stringByAppendingFormat:@" %@", v9];

      v5 = (void *)v11;
    }
  }

  return v5;
}

@end