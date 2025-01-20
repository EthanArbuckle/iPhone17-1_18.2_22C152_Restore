@interface CHAchievementDetailViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axAnnotateAchievementView;
- (void)viewDidLoad;
@end

@implementation CHAchievementDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHAchievementDetailViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CHAchievementDetailViewController" hasInstanceVariable:@"_achievement" withType:"ACHAchievement"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHAchievementDetailViewController", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHAchievementDetailViewController", @"badgeContainer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHAchievementDetailViewController", @"viewDidLoad", "v", 0);
  [v3 validateClass:@"CHAchievementDetailViewController" hasInstanceVariable:@"_locProvider" withType:"ACHAchievementLocalizationProvider"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ACHAchievementLocalizationProvider", @"titleForAchievement:", "@", "@", 0);
}

- (void)_axAnnotateAchievementView
{
  id v3 = [(CHAchievementDetailViewControllerAccessibility *)self safeValueForKey:@"_achievement"];
  char v24 = 0;
  objc_opt_class();
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  id v23 = 0;
  id v4 = v3;
  AXPerformSafeBlock();
  id v5 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  v6 = __UIAccessibilityCastAsClass();

  if (v24) {
    goto LABEL_8;
  }
  if ([v6 length])
  {
    v7 = [(CHAchievementDetailViewControllerAccessibility *)self safeUIViewForKey:@"badgeContainer"];
    [v7 setIsAccessibilityElement:1];
    v8 = accessibilityLocalizedString(@"achievement.badge.format");
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v6);
    [v7 setAccessibilityLabel:v9];

    [v7 _accessibilitySetViewIsVisible:1];
    [v7 _accessibilitySetOverridesInvisibility:1];
  }
  LOBYTE(v18) = 0;
  objc_opt_class();
  v10 = [(CHAchievementDetailViewControllerAccessibility *)self safeValueForKey:@"label"];
  v11 = __UIAccessibilityCastAsClass();

  if ((_BYTE)v18) {
LABEL_8:
  }
    abort();
  v12 = [v11 text];
  id v13 = [v12 length];

  if (v13)
  {
    v14 = [v11 text];
    v15 = +[NSCharacterSet newlineCharacterSet];
    v16 = [v14 componentsSeparatedByCharactersInSet:v15];

    v17 = AXLabelForElements();
    [v11 setAccessibilityLabel:v17];
  }
}

void __76__CHAchievementDetailViewControllerAccessibility__axAnnotateAchievementView__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) safeValueForKey:@"_locProvider"];
  uint64_t v2 = [v5 titleForAchievement:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementDetailViewControllerAccessibility;
  [(CHAchievementDetailViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(CHAchievementDetailViewControllerAccessibility *)self _axAnnotateAchievementView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementDetailViewControllerAccessibility;
  [(CHAchievementDetailViewControllerAccessibility *)&v3 viewDidLoad];
  [(CHAchievementDetailViewControllerAccessibility *)self _axAnnotateAchievementView];
}

@end