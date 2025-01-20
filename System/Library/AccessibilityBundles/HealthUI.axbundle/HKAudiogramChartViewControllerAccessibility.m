@interface HKAudiogramChartViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation HKAudiogramChartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HKAudiogramChartViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAudiogramChartViewController", @"_resetCurrentGraph", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HKAudiogramChartViewController", @"_updateHeaderState", "v", 0);
}

@end