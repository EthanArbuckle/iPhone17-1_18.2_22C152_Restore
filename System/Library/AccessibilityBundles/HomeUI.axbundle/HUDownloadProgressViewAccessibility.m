@interface HUDownloadProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation HUDownloadProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUDownloadProgressView";
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
  [(HUDownloadProgressViewAccessibility *)self safeCGFloatForKey:@"downloadProgress"];

  return (id)AXFormatFloatWithPercentage();
}

@end