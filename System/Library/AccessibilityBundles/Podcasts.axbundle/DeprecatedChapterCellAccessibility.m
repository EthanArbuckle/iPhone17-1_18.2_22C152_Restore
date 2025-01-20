@interface DeprecatedChapterCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLabelForPlaybackState:(int64_t)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation DeprecatedChapterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NowPlayingUI.DeprecatedChapterCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.DeprecatedChapterCell", @"accessibilityTitle", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.DeprecatedChapterCell", @"accessibilityDuration", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.DeprecatedChapterCell", @"accessibilityWantsNowPlayingIndicator", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NowPlayingUI.DeprecatedChapterCell", @"accessibilityPlaybackState", "q", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(DeprecatedChapterCellAccessibility *)self safeValueForKey:@"accessibilityTitle"];
  v4 = __UIAccessibilityCastAsClass();

  [(DeprecatedChapterCellAccessibility *)self safeDoubleForKey:@"accessibilityDuration"];
  if (v5 <= 0.00000011920929)
  {
    v6 = 0;
  }
  else
  {
    v6 = AXDurationStringForDuration();
  }
  if ([(DeprecatedChapterCellAccessibility *)self safeBoolForKey:@"accessibilityWantsNowPlayingIndicator"])uint64_t v7 = [(DeprecatedChapterCellAccessibility *)self safeIntegerForKey:@"accessibilityPlaybackState"]; {
  else
  }
    uint64_t v7 = 0;
  v10 = [(DeprecatedChapterCellAccessibility *)self _accessibilityLabelForPlaybackState:v7];
  v8 = __UIAXStringForVariables();

  return v8;
}

- (id)_accessibilityLabelForPlaybackState:(int64_t)a3
{
  if (a3 == 2)
  {
    v4 = @"paused";
LABEL_5:
    double v5 = accessibilityLocalizedString(v4);
    return v5;
  }
  if (a3 == 1)
  {
    v4 = @"now.playing";
    goto LABEL_5;
  }
  double v5 = 0;
  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)DeprecatedChapterCellAccessibility;
  return *MEMORY[0x263F1CEE8] | [(DeprecatedChapterCellAccessibility *)&v3 accessibilityTraits];
}

@end