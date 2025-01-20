@interface NTKTimeTravelModuleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityUseAccessibilityFrameForHittest;
- (BOOL)isAccessibilityElement;
- (NTKTimeTravelModuleViewAccessibility)initWithMaximumWidth:(double)a3;
- (id)_axRoundedDateForDate:(id)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation NTKTimeTravelModuleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKTimeTravelModuleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NTKTimeTravelModuleView" hasInstanceVariable:@"_timeScrubDifferenceLabel" withType:"UILabel"];
  [v3 validateClass:@"NTKTimeTravelModuleView" hasInstanceVariable:@"_timeScrubNowLabel" withType:"UILabel"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NTKTimeTravelModuleView", @"initWithMaximumWidth:", "@", "d", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CLKDate", @"complicationDate", "@", 0);
  [v3 validateClass:@"NTKTimeTravelModuleView" hasInstanceVariable:@"_date" withType:"NSDate"];
}

- (NTKTimeTravelModuleViewAccessibility)initWithMaximumWidth:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKTimeTravelModuleViewAccessibility;
  id v3 = [(NTKTimeTravelModuleViewAccessibility *)&v5 initWithMaximumWidth:a3];
  [(NTKTimeTravelModuleViewAccessibility *)v3 _accessibilityLoadAccessibilityInformation];
  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_timeScrubDifferenceLabel"];
  [v3 setIsAccessibilityElement:0];

  v4 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_timeScrubNowLabel"];
  [v4 setIsAccessibilityElement:0];

  v5.receiver = self;
  v5.super_class = (Class)NTKTimeTravelModuleViewAccessibility;
  [(NTKTimeTravelModuleViewAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  id v3 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_timeScrubDifferenceLabel"];
  if ([v3 _accessibilityViewIsVisible])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    objc_super v5 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_timeScrubNowLabel"];
    unsigned __int8 v4 = [v5 _accessibilityViewIsVisible];
  }
  return v4;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 1;
}

- (id)_axRoundedDateForDate:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    unsigned __int8 v4 = +[NSCalendar currentCalendar];
    objc_super v5 = [v4 components:126 fromDate:v3];

    v6 = [v4 dateFromComponents:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityLabel
{
  objc_opt_class();
  id v3 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_timeScrubNowLabel"];
  unsigned __int8 v4 = __UIAccessibilityCastAsClass();

  if ([v4 _accessibilityViewIsVisible])
  {
    objc_super v5 = [v4 accessibilityLabel];
  }
  else
  {
    v6 = [(id)AXSafeClassFromString() safeValueForKey:@"complicationDate"];
    v7 = [(NTKTimeTravelModuleViewAccessibility *)self _axRoundedDateForDate:v6];

    v8 = [(NTKTimeTravelModuleViewAccessibility *)self safeValueForKey:@"_date"];
    [v8 timeIntervalSinceDate:v7];
    objc_super v5 = AXDurationStringForDurationWithSeconds();
  }

  return v5;
}

@end