@interface VOGestureMat
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetCurrentGesture:(id)a3;
@end

@implementation VOGestureMat

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = settingsLocString(@"VOICEOVER_GESTURE_HELP_HINT_PART1", @"VoiceOverSettings");
  v3 = settingsLocString(@"VOICEOVER_GESTURE_HELP_HINT_PART2", @"VoiceOverSettings");
  v4 = +[NSString stringWithFormat:@"%@ %@", v2, v3];

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitSummaryElement | 0x8000000000;
}

- (void)_accessibilitySetCurrentGesture:(id)a3
{
  id v4 = a3;
  id v5 = [(VOGestureMat *)self superview];
  [v5 _accessibilitySetCurrentGesture:v4];
}

@end