@interface SeymourUI_WorkoutMediaTagsCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SeymourUI_WorkoutMediaTagsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SeymourUI.WorkoutMediaTagsCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.WorkoutMediaTagsCell", @"tagsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SeymourUI.WorkoutMediaTagsCell", @"accessibilityMediaTags", "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v17.receiver = self;
  v17.super_class = (Class)SeymourUI_WorkoutMediaTagsCellAccessibility;
  [(SeymourUI_WorkoutMediaTagsCellAccessibility *)&v17 _accessibilityLoadAccessibilityInformation];
  char v16 = 0;
  objc_opt_class();
  id v3 = [(SeymourUI_WorkoutMediaTagsCellAccessibility *)self safeValueForKey:@"tagsLabel"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(SeymourUI_WorkoutMediaTagsCellAccessibility *)self safeArrayForKey:@"accessibilityMediaTags"];
  v6 = _accessibilityDescriptionForMediaTags(v5);
  v7 = [v4 text];

  if (v7)
  {
    v8 = [v4 text];
    _accessibilityReplaceStylsticBulletsForSpeaking(v8, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_26F7B5DB0;
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__SeymourUI_WorkoutMediaTagsCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v13[3] = &unk_26514EF40;
  v14 = v10;
  id v15 = v6;
  id v11 = v6;
  v12 = v10;
  [v4 _setAccessibilityLabelBlock:v13];
}

@end