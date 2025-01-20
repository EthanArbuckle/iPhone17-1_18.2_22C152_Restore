@interface CNMeCardSharingOnboardingAvatarCarouselCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axCarouselItem;
- (id)accessibilityLabel;
- (unint64_t)_axImageType;
- (unint64_t)accessibilityTraits;
- (void)_axSetCarouselItem:(id)a3;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CNMeCardSharingOnboardingAvatarCarouselCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCarouselItem
{
}

- (void)_axSetCarouselItem:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"CNMeCardSharingOnboardingAvatarCarouselItem"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNMeCardSharingOnboardingAvatarCarouselItem", @"title", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"CNMeCardSharingOnboardingAvatarCarouselItem", @"imageType", "Q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = [(CNMeCardSharingOnboardingAvatarCarouselCellAccessibility *)self _axCarouselItem];
  id v3 = [v2 safeStringForKey:@"title"];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
LABEL_5:
    v7 = v5;
    goto LABEL_7;
  }
  unint64_t v6 = [v2 safeIntegerForKey:@"imageType"];
  if (v6 <= 4)
  {
    accessibilityLocalizedString(off_265118108[v6]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2 = *MEMORY[0x263F1CEE8];
  unint64_t v3 = [(CNMeCardSharingOnboardingAvatarCarouselCellAccessibility *)self _axImageType];
  if (v3 <= 4 && ((1 << v3) & 0x1A) != 0) {
    v2 |= *MEMORY[0x263F1CF00];
  }
  return v2;
}

- (unint64_t)_axImageType
{
  unint64_t v2 = [(CNMeCardSharingOnboardingAvatarCarouselCellAccessibility *)self _axCarouselItem];
  unint64_t v3 = [v2 safeIntegerForKey:@"imageType"];

  return v3;
}

@end