@interface EpisodeInfoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelForPlaybackState:(BOOL)a3;
- (id)accessibilityLabel;
@end

@implementation EpisodeInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ShelfKitCollectionViews.EpisodeInfoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityIsNowPlayingIndicatorVisible", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityEyebrowLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityTitleLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ShelfKitCollectionViews.EpisodeInfoView", @"accessibilityFooterLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if ([(EpisodeInfoViewAccessibility *)self safeBoolForKey:@"accessibilityIsNowPlayingIndicatorVisible"])
  {
    id v3 = [(EpisodeInfoViewAccessibility *)self _accessibilityLabelForPlaybackState:1];
  }
  else
  {
    id v3 = 0;
  }
  v7 = [(EpisodeInfoViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityEyebrowLabel, accessibilityTitleLabel, accessibilityFooterLabel"];
  v4 = __UIAXStringForVariables();
  v5 = accessibilityStripUnfavorableCharacters(v4);

  return v5;
}

- (id)_accessibilityLabelForPlaybackState:(BOOL)a3
{
  if (a3) {
    id v3 = @"now.playing";
  }
  else {
    id v3 = @"paused";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

@end