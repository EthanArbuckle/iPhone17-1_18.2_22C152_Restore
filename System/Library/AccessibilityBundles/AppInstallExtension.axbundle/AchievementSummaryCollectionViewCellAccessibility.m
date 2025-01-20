@interface AchievementSummaryCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AchievementSummaryCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.AchievementSummaryCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppInstallExtension.AchievementSummaryCollectionViewCell" hasSwiftField:@"achievementGroupView" withSwiftType:"Optional<AchievementGroupView>"];
  [v3 validateClass:@"AppInstallExtension.AchievementSummaryCollectionViewCell" hasSwiftField:@"numberCompletedLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"AppInstallExtension.AchievementSummaryCollectionViewCell" hasSwiftField:@"outOfTotalLabel" withSwiftType:"DynamicTypeLabel"];
  [v3 validateClass:@"AppStoreKitInternal.AchievementGroupView" hasSwiftField:@"achievement" withSwiftType:"Optional<AchievementCard>"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(AchievementSummaryCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"achievementGroupView"];
  v4 = [v3 safeSwiftValueForKey:@"achievement"];
  v5 = [(AchievementSummaryCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"numberCompletedLabel"];
  v6 = [(AchievementSummaryCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"outOfTotalLabel"];
  v7 = [v5 accessibilityLabel];
  uint64_t v8 = [v7 intValue];
  v9 = [v6 accessibilityLabel];
  v10 = [v9 stringByReplacingOccurrencesOfString:@"\u202A/ " withString:&stru_26F6043D0];

  uint64_t v11 = [v10 intValue];
  v12 = NSString;
  v13 = accessibilityAppStoreLocalizedString(@"game.achievements.completed");
  v14 = objc_msgSend(v12, "stringWithFormat:", v13, v8, v11);

  v15 = __UIAXStringForVariables();

  return v15;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AchievementSummaryCollectionViewCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AchievementSummaryCollectionViewCellAccessibility *)&v3 accessibilityTraits];
}

@end