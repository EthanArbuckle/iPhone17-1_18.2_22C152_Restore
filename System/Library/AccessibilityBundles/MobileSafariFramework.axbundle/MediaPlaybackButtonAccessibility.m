@interface MediaPlaybackButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MediaPlaybackButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFMediaPlaybackButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SFMediaPlaybackButton" hasSwiftField:@"isPlaying" withSwiftType:"Bool"];
  [v3 validateClass:@"SFMediaPlaybackButton" hasSwiftField:@"playbackType" withSwiftType:"PlaybackType"];
}

- (id)accessibilityLabel
{
  id v3 = [(MediaPlaybackButtonAccessibility *)self safeSwiftValueForKey:@"playbackType"];
  v4 = [v3 safeSwiftEnumCase];

  if ([v4 isEqualToString:@"back"])
  {
    v5 = @"playback.back.button";
  }
  else if ([v4 isEqualToString:@"forward"])
  {
    v5 = @"playback.forward.button";
  }
  else
  {
    if (![v4 isEqualToString:@"play"])
    {
      v9.receiver = self;
      v9.super_class = (Class)MediaPlaybackButtonAccessibility;
      uint64_t v6 = [(MediaPlaybackButtonAccessibility *)&v9 accessibilityLabel];
      goto LABEL_11;
    }
    if ([(MediaPlaybackButtonAccessibility *)self safeSwiftBoolForKey:@"isPlaying"]) {
      v5 = @"playback.pause.button";
    }
    else {
      v5 = @"playback.play.button";
    }
  }
  uint64_t v6 = accessibilityMobileSafariLocalizedString(v5);
LABEL_11:
  v7 = (void *)v6;

  return v7;
}

@end