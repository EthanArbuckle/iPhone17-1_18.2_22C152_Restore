@interface TrophyCaseSectionCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axLabelForAchievementLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TrophyCaseSectionCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FitnessApp.TrophyCaseSectionCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v7.receiver = self;
  v7.super_class = (Class)TrophyCaseSectionCellAccessibility;
  [(TrophyCaseSectionCellAccessibility *)&v7 _accessibilityLoadAccessibilityInformation];
  objc_initWeak(&location, self);
  v3 = [(TrophyCaseSectionCellAccessibility *)self safeSwiftValueForKey:@"achievementTitleLabel"];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __80__TrophyCaseSectionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_18448;
  objc_copyWeak(&v5, &location);
  [v3 setAccessibilityLabelBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __80__TrophyCaseSectionCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _axLabelForAchievementLabel];

  return v2;
}

- (id)_axLabelForAchievementLabel
{
  objc_opt_class();
  v3 = [(TrophyCaseSectionCellAccessibility *)self safeSwiftValueForKey:@"achievementTitleLabel"];
  v4 = __UIAccessibilityCastAsClass();

  id v5 = [v4 attributedText];
  v6 = [v5 string];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 text];
  }
  v9 = v8;

  v10 = [v9 stringByReplacingOccurrencesOfString:@"\n", @", " withString];

  return v10;
}

@end