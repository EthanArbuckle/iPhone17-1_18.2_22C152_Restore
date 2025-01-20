@interface FIUIWorkoutCompletionPercentageRingViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation FIUIWorkoutCompletionPercentageRingViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FIUIWorkoutCompletionPercentageRingViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIWorkoutCompletionPercentageRingViewCell", @"ringsView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIWorkoutCompletionPercentageRingViewCell", @"typeLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"FIUIWorkoutCompletionPercentageRingViewCell", @"secondaryLabel", "@", 0);
}

- (id)accessibilityLabel
{
  id v3 = [(FIUIWorkoutCompletionPercentageRingViewCellAccessibility *)self safeValueForKey:@"typeLabel"];
  v4 = [v3 accessibilityLabel];

  v5 = [(FIUIWorkoutCompletionPercentageRingViewCellAccessibility *)self safeValueForKey:@"ringsView"];
  v6 = [v5 accessibilityLabel];

  v7 = [(FIUIWorkoutCompletionPercentageRingViewCellAccessibility *)self safeValueForKey:@"secondaryLabel"];
  v8 = [v7 accessibilityLabel];

  [v8 length];
  v9 = __UIAXStringForVariables();

  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end