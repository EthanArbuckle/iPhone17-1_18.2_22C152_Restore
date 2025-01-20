@interface VideoHeaderLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityVideoLabel;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)_accessibilitySetVideoLabel:(id)a3;
@end

@implementation VideoHeaderLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MusicApplication.VideoHeaderLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityVideoLabel
{
}

- (void)_accessibilitySetVideoLabel:(id)a3
{
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = accessibilityMusicLocalizedString(@"video.artwork");
  v6 = [(VideoHeaderLockupViewAccessibility *)self _accessibilityVideoLabel];
  v4 = __UIAXStringForVariables();

  return v4;
}

- (id)accessibilityValue
{
  v2 = [(VideoHeaderLockupViewAccessibility *)self safeValueForKey:@"accessibilityProgressView"];
  v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)VideoHeaderLockupViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(VideoHeaderLockupViewAccessibility *)&v3 accessibilityTraits];
}

@end