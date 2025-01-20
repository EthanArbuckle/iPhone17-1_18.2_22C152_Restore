@interface AchievementCardAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AchievementCardAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GameCenterUI.AchievementCard";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementCard", @"accessibilityBadge", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementLocked", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementCompleted", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityIsAchievementInProgress", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementCard", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementCard", @"accessibilitySubtitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementCard", @"accessibilityAchievementCompletedDate", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"GameCenterUI.AchievementBadge", @"accessibilityProgress", "d", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(AchievementCardAccessibility *)self safeValueForKey:@"accessibilityBadge"];
  int v4 = [v3 safeBoolForKey:@"accessibilityIsAchievementLocked"];
  int v5 = [v3 safeBoolForKey:@"accessibilityIsAchievementCompleted"];
  int v6 = [v3 safeBoolForKey:@"accessibilityIsAchievementInProgress"];
  v7 = [(AchievementCardAccessibility *)self safeValueForKey:@"accessibilityTitleLabel"];
  v8 = [(AchievementCardAccessibility *)self safeValueForKey:@"accessibilitySubtitleLabel"];
  objc_opt_class();
  v9 = [(AchievementCardAccessibility *)self safeValueForKey:@"accessibilityAchievementCompletedDate"];
  v10 = __UIAccessibilityCastAsClass();

  [v3 safeCGFloatForKey:@"accessibilityProgress"];
  if (v4)
  {
    v12 = AXGameCenterUIFrameworkLocString(@"LOCKED");
    v13 = [v7 accessibilityLabel];
    v14 = [v8 accessibilityLabel];
    v15 = __UIAXStringForVariables();
LABEL_8:

    goto LABEL_9;
  }
  if (v5)
  {
    v12 = AXGameCenterUIFrameworkLocString(@"COMPLETED");
    uint64_t v16 = AXDateStringForFormat();
LABEL_7:
    v13 = (void *)v16;
    v14 = [v7 accessibilityLabel];
    v20 = [v8 accessibilityLabel];
    v15 = __UIAXStringForVariables();

    goto LABEL_8;
  }
  if (v6)
  {
    double v17 = v11;
    v12 = AXGameCenterUIFrameworkLocString(@"IN_PROGRESS");
    float v18 = v17 / 100.0;
    uint64_t v16 = MEMORY[0x24564DC50](0, v18);
    goto LABEL_7;
  }
  v12 = [v7 accessibilityLabel];
  v13 = [v8 accessibilityLabel];
  v15 = __UIAXStringForVariables();
LABEL_9:

  return v15;
}

@end