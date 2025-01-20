@interface PlayerTimeControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsLiveContent;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAbsoluteValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityIncreaseAmount:(BOOL)a3;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation PlayerTimeControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.PlayerTimeControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PlayerTimeControl", @"accessibilityTotalDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PlayerTimeControl", @"accessibilityElapsedDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PlayerTimeControl", @"accessibilityUpdateWithElapsedDuration:", "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PlayerTimeControl", @"accessibilityIsLiveContent", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MusicApplication.PlayerTimeControl", @"liveLabel", "@", 0);
}

- (BOOL)isAccessibilityElement
{
  BOOL result = 1;
  if ([(PlayerTimeControlAccessibility *)self _axIsLiveContent])
  {
    id v3 = [(PlayerTimeControlAccessibility *)self safeValueForKey:@"liveLabel"];
    int v4 = [v3 _accessibilityViewIsVisible];

    if (!v4) {
      return 0;
    }
  }
  return result;
}

- (BOOL)_axIsLiveContent
{
  return [(PlayerTimeControlAccessibility *)self safeBoolForKey:@"accessibilityIsLiveContent"];
}

- (id)accessibilityLabel
{
  if ([(PlayerTimeControlAccessibility *)self _axIsLiveContent])
  {
    id v3 = [(PlayerTimeControlAccessibility *)self safeValueForKey:@"liveLabel"];
    int v4 = [v3 accessibilityLabel];
    v5 = AXAttributedStringForBetterPronuciation();
  }
  else
  {
    v5 = accessibilityMusicLocalizedString(@"track.position.label");
  }

  return v5;
}

- (id)accessibilityValue
{
  [(PlayerTimeControlAccessibility *)self safeDoubleForKey:@"accessibilityTotalDuration"];
  [(PlayerTimeControlAccessibility *)self safeDoubleForKey:@"accessibilityElapsedDuration"];
  if (_AXSAutomationEnabled())
  {
    id v3 = AXPositionalStyleDurationStringForDuration();
    int v4 = AXPositionalStyleDurationStringForDuration();
    uint64_t v5 = [NSString stringWithFormat:@"%@ of %@", v3, v4];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  id v3 = AXDurationStringForDuration();
  int v4 = AXDurationStringForDuration();
  if ([(PlayerTimeControlAccessibility *)self _axIsLiveContent])
  {
    uint64_t v5 = accessibilityMusicLocalizedString(@"no.track.position");
    goto LABEL_5;
  }
  v7 = NSString;
  v8 = accessibilityMusicLocalizedString(@"track.position.value");
  v6 = objc_msgSend(v7, "stringWithFormat:", v8, v3, v4);

LABEL_7:

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v5.receiver = self;
  v5.super_class = (Class)PlayerTimeControlAccessibility;
  unint64_t v3 = [(PlayerTimeControlAccessibility *)&v5 accessibilityTraits];
  if ([(PlayerTimeControlAccessibility *)self _axIsLiveContent]) {
    return *MEMORY[0x263F1CF18] | _AXTraitsRemoveTrait();
  }
  else {
    return *MEMORY[0x263F1CED8] | v3;
  }
}

- (void)_accessibilityIncreaseAmount:(BOOL)a3
{
}

uint64_t __63__PlayerTimeControlAccessibility__accessibilityIncreaseAmount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accessibilityUpdateWithElapsedDuration:*(double *)(a1 + 40)];
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)_accessibilityAbsoluteValue
{
  [(PlayerTimeControlAccessibility *)self safeDoubleForKey:@"accessibilityTotalDuration"];
  double v4 = v3;
  [(PlayerTimeControlAccessibility *)self safeDoubleForKey:@"accessibilityElapsedDuration"];
  double v7 = v5 / v4;
  v6 = NSNumber;
  *(float *)&double v7 = v7;

  return (id)[v6 numberWithFloat:v7];
}

@end