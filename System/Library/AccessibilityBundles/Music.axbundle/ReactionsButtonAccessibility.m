@interface ReactionsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation ReactionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TtCE5MusicO11MusicCoreUI9Reactions7Control";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicNowPlayingControlsViewController", @"reactionButton", "@", 0);
  [v3 validateClass:@"_TtCE5MusicO11MusicCoreUI9Reactions7Control" hasSwiftField:@"context" withSwiftType:"Context"];
  [v3 validateSwiftEnum:@"MusicCoreUI.Reactions"];
}

- (id)accessibilityLabel
{
  return accessibilityMusicLocalizedString(@"reactions.button.label");
}

- (id)accessibilityValue
{
  objc_opt_class();
  id v3 = [(ReactionsButtonAccessibility *)self safeSwiftValueForKey:@"context"];
  v4 = [v3 safeSwiftArrayForKey:@"reactions"];
  v5 = [v4 firstObject];
  v6 = __UIAccessibilityCastAsClass();

  v7 = [v6 reactionText];

  return v7;
}

@end