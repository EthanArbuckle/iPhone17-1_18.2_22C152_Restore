@interface PodcastsUIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityPlayer;
- (id)accessibilityPlaybackSpeed;
@end

@implementation PodcastsUIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MTPlayerController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"MTPlayerController", @"defaultInstance", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTPlayerController", @"mediaRemoteController", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMMediaRemoteController", @"player", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAVPlayer", @"playbackSpeed", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"IMAVPlayer", @"togglePlayPause", "B", 0);
}

- (id)_accessibilityPlayer
{
  v2 = objc_msgSend((id)MEMORY[0x24565B6C0](@"MTPlayerController", a2), "safeValueForKey:", @"defaultInstance");
  id v3 = [v2 safeValueForKey:@"mediaRemoteController"];

  v4 = [v3 safeValueForKey:@"player"];

  return v4;
}

- (id)accessibilityPlaybackSpeed
{
  v2 = [(PodcastsUIApplicationAccessibility *)self _accessibilityPlayer];
  unint64_t v3 = [v2 safeUnsignedIntegerForKey:@"playbackSpeed"];

  if (v3 > 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = accessibilityLocalizedString(off_265144330[v3]);
  }

  return v4;
}

@end