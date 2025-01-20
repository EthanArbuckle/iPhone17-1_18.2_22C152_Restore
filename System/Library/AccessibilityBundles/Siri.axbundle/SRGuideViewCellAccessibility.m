@interface SRGuideViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation SRGuideViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SRGuideViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SRGuideViewCell" hasInstanceVariable:@"_nameLabel" withType:"SiriSharedUIContentLabel"];
  [v3 validateClass:@"SRGuideViewCell" hasInstanceVariable:@"_tagPhraseLabel" withType:"SiriSharedUIContentLabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (id)accessibilityLabel
{
  v2 = [(SRGuideViewCellAccessibility *)self safeValueForKey:@"_nameLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(SRGuideViewCellAccessibility *)self safeValueForKey:@"_tagPhraseLabel"];
  id v3 = [v2 accessibilityLabel];

  return v3;
}

@end