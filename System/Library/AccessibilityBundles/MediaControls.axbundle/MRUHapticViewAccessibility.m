@interface MRUHapticViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation MRUHapticViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MRUHapticView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)MRUHapticViewAccessibility;
  return *MEMORY[0x263F1CF60] | [(MRUHapticViewAccessibility *)&v3 accessibilityTraits];
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"music.haptics");
}

- (id)accessibilityValue
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  if ([v2 hapticMusicActive]) {
    objc_super v3 = @"music.haptics.active.value";
  }
  else {
    objc_super v3 = @"music.haptics.inactive.value";
  }
  v4 = accessibilityLocalizedString(v3);

  return v4;
}

@end