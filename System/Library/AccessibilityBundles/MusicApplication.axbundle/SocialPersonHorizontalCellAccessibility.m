@interface SocialPersonHorizontalCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)_axFollowButton;
- (id)accessibilityCustomActions;
- (id)accessibilityLabel;
- (id)accessibilitySocialPersonCustomActions;
- (id)automationElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityApproveButtonAction:(id)a3;
- (void)_accessibilityDeclineButtonAction:(id)a3;
- (void)setAccessibilitySocialPersonCustomActions:(id)a3;
@end

@implementation SocialPersonHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.SocialPersonHorizontalCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilitySocialPersonCustomActions
{
}

- (void)setAccessibilitySocialPersonCustomActions:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityPersonName", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityPersonSubtitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityFollowButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityApproveButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityDeclineButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.SocialPersonHorizontalCell", @"accessibilityIsFollowRequest", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(SocialPersonHorizontalCellAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityPersonName, accessibilityPersonSubtitle"];
}

- (id)automationElements
{
  v10.receiver = self;
  v10.super_class = (Class)SocialPersonHorizontalCellAccessibility;
  id v3 = [(SocialPersonHorizontalCellAccessibility *)&v10 automationElements];
  v4 = (void *)[v3 mutableCopy];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x263EFF980] array];
  }
  v7 = v6;

  v8 = [(SocialPersonHorizontalCellAccessibility *)self _axFollowButton];
  [v7 axSafelyAddObject:v8];

  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SocialPersonHorizontalCellAccessibility *)self _axFollowButton];
  v5 = [(SocialPersonHorizontalCellAccessibility *)self safeValueForKey:@"accessibilityPersonName"];
  [v4 setAccessibilityValue:v5];

  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (void)_accessibilityApproveButtonAction:(id)a3
{
  id v3 = [(SocialPersonHorizontalCellAccessibility *)self safeValueForKey:@"accessibilityApproveButton"];
  [v3 accessibilityActivate];
}

- (void)_accessibilityDeclineButtonAction:(id)a3
{
  id v3 = [(SocialPersonHorizontalCellAccessibility *)self safeValueForKey:@"accessibilityDeclineButton"];
  [v3 accessibilityActivate];
}

- (id)accessibilityCustomActions
{
  v11[2] = *MEMORY[0x263EF8340];
  if ([(SocialPersonHorizontalCellAccessibility *)self safeBoolForKey:@"accessibilityIsFollowRequest"])
  {
    id v3 = objc_alloc(MEMORY[0x263F1C390]);
    v4 = accessibilityMusicLocalizedString(@"approve.action");
    v5 = (void *)[v3 initWithName:v4 target:self selector:sel__accessibilityApproveButtonAction_];

    id v6 = objc_alloc(MEMORY[0x263F1C390]);
    v7 = accessibilityMusicLocalizedString(@"decline.action");
    v8 = (void *)[v6 initWithName:v7 target:self selector:sel__accessibilityDeclineButtonAction_];

    v11[0] = v5;
    v11[1] = v8;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)SocialPersonHorizontalCellAccessibility;
  return *MEMORY[0x263F1CF18] | [(SocialPersonHorizontalCellAccessibility *)&v3 accessibilityTraits];
}

- (id)_axFollowButton
{
  return (id)[(SocialPersonHorizontalCellAccessibility *)self safeValueForKey:@"accessibilityFollowButton"];
}

@end