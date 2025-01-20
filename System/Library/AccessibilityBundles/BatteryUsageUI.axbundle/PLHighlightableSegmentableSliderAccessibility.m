@interface PLHighlightableSegmentableSliderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation PLHighlightableSegmentableSliderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PLHighlightableSegmentableSlider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityValue
{
  [(PLHighlightableSegmentableSliderAccessibility *)self safeFloatForKey:@"rtlConsideredValue"];
  v2 = objc_msgSend(NSNumber, "numberWithFloat:");
  v3 = [v2 stringValue];

  return v3;
}

@end