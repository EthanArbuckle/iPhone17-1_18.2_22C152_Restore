@interface StoryCardCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation StoryCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AppInstallExtension.StoryCardCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AppInstallExtension.StoryCardCollectionViewCell" hasSwiftField:@"infoLayer" withSwiftType:"TodayCardInfoLayerView"];
  [v3 validateClass:@"AppInstallExtension.TodayCardInfoLayerView" hasSwiftField:@"overlay" withSwiftType:"Optional<AnyTodayCardCellOverlay>"];
  [v3 validateClass:@"AppInstallExtension.TodayCardInfoLayerView" hasSwiftField:@"labelsView" withSwiftType:"TodayCardLabelsView"];
  [v3 validateClass:@"AppInstallExtension.StoryCardCollectionViewCell" hasSwiftField:@"mediaBackgroundView" withSwiftType:"StoryCardMediaView"];
  [v3 validateClass:@"AppInstallExtension.StoryCardMediaView" hasSwiftField:@"revealingVideoView" withSwiftType:"RevealingVideoView"];
  [v3 validateClass:@"AppInstallExtension.RevealingVideoView" hasSwiftField:@"videoView" withSwiftType:"Optional<TodayCardVideoView>"];
  [v3 validateClass:@"AppInstallExtension.VideoView" hasSwiftField:@"playButton" withSwiftType:"PlayButton"];
  [v3 validateClass:@"AVVolumeButtonControl"];
}

- (id)accessibilityElements
{
  id v3 = [MEMORY[0x263EFF980] array];
  v4 = [(StoryCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"mediaBackgroundView"];
  v5 = [v4 safeSwiftValueForKey:@"revealingVideoView"];
  v6 = [v5 safeSwiftValueForKey:@"videoView"];
  v7 = [v6 safeSwiftValueForKey:@"playButton"];
  [v7 safeCGFloatForKey:@"alpha"];
  if (v8 > 0.0) {
    [v3 axSafelyAddObject:v7];
  }
  v9 = [v6 _accessibilityDescendantOfType:MEMORY[0x245640BA0](@"AVVolumeButtonControl")];
  [v3 axSafelyAddObject:v9];
  v10 = [(StoryCardCollectionViewCellAccessibility *)self safeSwiftValueForKey:@"infoLayer"];
  v11 = [v10 safeSwiftValueForKey:@"labelsView"];
  [v11 setIsAccessibilityElement:1];
  [v11 setAccessibilityTraits:*MEMORY[0x263F1CEF8]];
  [v3 axSafelyAddObject:v11];
  v12 = [v10 safeSwiftValueForKey:@"overlay"];
  [v3 axSafelyAddObject:v12];

  return v3;
}

@end