@interface CHWorkoutCellImageLabelViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CHWorkoutCellImageLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHWorkoutCellImageLabelView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHWorkoutCellImageLabelView" hasSwiftField:@"badgeCountLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"CHWorkoutCellImageLabelView" hasSwiftField:@"goalLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"CHWorkoutCellImageLabelView" hasSwiftField:@"achievementCount" withSwiftType:"Int"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v12.receiver = self;
  v12.super_class = (Class)CHWorkoutCellImageLabelViewAccessibility;
  [(CHWorkoutCellImageLabelViewAccessibility *)&v12 _accessibilityLoadAccessibilityInformation];
  id v3 = [(CHWorkoutCellImageLabelViewAccessibility *)self safeSwiftValueForKey:@"badgeCountLabel"];
  v4 = accessibilityLocalizedString(@"award.format");
  id v7 = [(CHWorkoutCellImageLabelViewAccessibility *)self safeSwiftIntForKey:@"achievementCount"];
  v5 = AXCFormattedString();
  objc_msgSend(v3, "setAccessibilityLabel:", v5, v7);

  v6 = [(CHWorkoutCellImageLabelViewAccessibility *)self safeSwiftValueForKey:@"goalLabel"];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __86__CHWorkoutCellImageLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v8[3] = &unk_18448;
  objc_copyWeak(&v9, &from);
  [v6 _setAccessibilityLabelBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

id __86__CHWorkoutCellImageLabelViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained text];

  if ([v2 containsString:@":"])
  {
    uint64_t v3 = [v2 stringByAppendingString:@":00"];

    v2 = (void *)v3;
  }
  v4 = AXLocalizeDurationTime();

  return v4;
}

@end