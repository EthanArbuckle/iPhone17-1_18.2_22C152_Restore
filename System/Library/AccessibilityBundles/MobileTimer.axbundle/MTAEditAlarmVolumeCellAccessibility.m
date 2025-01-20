@interface MTAEditAlarmVolumeCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
@end

@implementation MTAEditAlarmVolumeCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTAEditAlarmVolumeCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MTAEditAlarmVolumeCell", @"volumeSlider", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UISlider", @"_accessibilityBumpValue:", "v", "B", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"alarm.volume");
}

- (id)accessibilityValue
{
  v2 = [(MTAEditAlarmVolumeCellAccessibility *)self safeValueForKey:@"volumeSlider"];
  id v3 = [v2 accessibilityValue];

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v2 = [(MTAEditAlarmVolumeCellAccessibility *)self safeValueForKey:@"volumeSlider"];
  unint64_t v3 = [v2 accessibilityTraits];

  return v3;
}

- (void)accessibilityIncrement
{
  objc_opt_class();
  unint64_t v3 = [(MTAEditAlarmVolumeCellAccessibility *)self safeValueForKey:@"volumeSlider"];
  v4 = __UIAccessibilityCastAsClass();

  if (objc_opt_respondsToSelector()) {
    [v4 _accessibilityBumpValue:1];
  }
}

- (void)accessibilityDecrement
{
  objc_opt_class();
  unint64_t v3 = [(MTAEditAlarmVolumeCellAccessibility *)self safeValueForKey:@"volumeSlider"];
  v4 = __UIAccessibilityCastAsClass();

  if (objc_opt_respondsToSelector()) {
    [v4 _accessibilityBumpValue:0];
  }
}

@end