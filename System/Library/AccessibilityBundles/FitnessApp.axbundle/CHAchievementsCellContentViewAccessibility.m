@interface CHAchievementsCellContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation CHAchievementsCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CHAchievementsCellContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHAchievementsCellContentView", @"label", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CHAchievementsCellContentView", @"badgeView", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  char v13 = 0;
  objc_opt_class();
  id v3 = [(CHAchievementsCellContentViewAccessibility *)self safeValueForKey:@"_label"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [v4 text];
  id v6 = [v5 length];

  if (v6)
  {
    v7 = [v4 text];
    v8 = +[NSCharacterSet newlineCharacterSet];
    v9 = [v7 componentsSeparatedByCharactersInSet:v8];
    v10 = AXLabelForElements();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CHAchievementsCellContentViewAccessibility;
    v10 = [(CHAchievementsCellContentViewAccessibility *)&v12 accessibilityLabel];
  }

  return v10;
}

- (id)accessibilityValue
{
  id v3 = [(CHAchievementsCellContentViewAccessibility *)self safeValueForKey:@"_badgeView"];
  v4 = [v3 safeValueForKey:@"image"];
  v5 = [v4 accessibilityValue];

  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CHAchievementsCellContentViewAccessibility;
    id v6 = [(CHAchievementsCellContentViewAccessibility *)&v9 accessibilityValue];
  }
  v7 = v6;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)CHAchievementsCellContentViewAccessibility;
  return UIAccessibilityTraitButton | [(CHAchievementsCellContentViewAccessibility *)&v3 accessibilityTraits];
}

@end