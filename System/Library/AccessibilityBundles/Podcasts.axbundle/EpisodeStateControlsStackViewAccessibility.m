@interface EpisodeStateControlsStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation EpisodeStateControlsStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.EpisodeStateControlsStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeStateControlsStackView", @"accessibilityBookmarkBadge", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeStateControlsStackView", @"accessibilityDownloadBadge", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)EpisodeStateControlsStackViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(EpisodeStateControlsStackViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(EpisodeStateControlsStackViewAccessibility *)self safeValueForKey:@"accessibilityBookmarkBadge"];
  if ([v3 _accessibilityViewIsVisible])
  {
    v4 = accessibilityLocalizedString(@"saved");
  }
  else
  {
    v4 = 0;
  }
  v5 = [(EpisodeStateControlsStackViewAccessibility *)self safeValueForKey:@"accessibilityDownloadBadge"];
  if ([v5 _accessibilityViewIsVisible])
  {
    v6 = accessibilityLocalizedString(@"downloaded");
  }
  else
  {
    v6 = 0;
  }
  v7 = __UIAXStringForVariables();

  return v7;
}

@end