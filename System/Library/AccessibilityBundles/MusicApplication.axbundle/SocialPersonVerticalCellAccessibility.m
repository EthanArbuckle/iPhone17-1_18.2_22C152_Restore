@interface SocialPersonVerticalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation SocialPersonVerticalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SocialPersonVerticalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonVerticalCell", @"accessibilityPersonName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonVerticalCell", @"accessibilityPersonSubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonVerticalCell", @"accessibilityFollowButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonVerticalCell", @"accessibilityCloseButton", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SocialPersonVerticalCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityPersonName, accessibilityPersonSubtitle"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SocialPersonVerticalCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(SocialPersonVerticalCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_accessibilitySupplementaryFooterViews
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SocialPersonVerticalCellAccessibility *)self safeValueForKey:@"accessibilityFollowButton"];
  v5 = [(SocialPersonVerticalCellAccessibility *)self safeValueForKey:@"accessibilityPersonName"];
  [v4 setAccessibilityValue:v5];

  if (v4) {
    [v3 addObject:v4];
  }
  v6 = [(SocialPersonVerticalCellAccessibility *)self safeValueForKey:@"accessibilityCloseButton"];
  v7 = accessibilityMusicLocalizedString(@"close.button");
  [v6 setAccessibilityLabel:v7];

  v8 = [(SocialPersonVerticalCellAccessibility *)self safeValueForKey:@"accessibilityPersonName"];
  [v6 setAccessibilityValue:v8];

  if (v6) {
    [v3 addObject:v6];
  }

  return v3;
}

@end