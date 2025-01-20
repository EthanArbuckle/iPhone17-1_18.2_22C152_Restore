@interface PHAudioControlsButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (unint64_t)accessibilityTraits;
@end

@implementation PHAudioControlsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PHAudioControlsButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)PHAudioControlsButtonAccessibility;
  unint64_t v3 = [(PHAudioControlsButtonAccessibility *)&v7 accessibilityTraits];
  uint64_t v4 = [(PHAudioControlsButtonAccessibility *)self safeUnsignedIntegerForKey:@"controlType"];
  if (v4 == 14 || v4 == 11) {
    v3 &= ~*MEMORY[0x263F1CF38];
  }
  return v3;
}

@end